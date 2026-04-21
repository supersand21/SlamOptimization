# Modified by Raul Mur-Artal
# Automatically compute the optimal scale factor for monocular VO/SLAM.

# Software License Agreement (BSD License)
#
# Copyright (c) 2013, Juergen Sturm, TUM
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of TUM nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# Requirements: 
# sudo apt-get install python3-argparse

"""
This script computes the absolute trajectory error from the ground truth
trajectory and the estimated trajectory.
"""

import sys
from datetime import datetime
import numpy
import argparse
import associate


def align(model, data):
    """Align two trajectories using the method of Horn (closed-form)."""

    numpy.set_printoptions(precision=3, suppress=True)
    model_zerocentered = model - model.mean(1)
    data_zerocentered = data - data.mean(1)

    W = numpy.zeros((3, 3))
    for column in range(model.shape[1]):
        W += numpy.outer(model_zerocentered[:, column],
                         data_zerocentered[:, column])

    U, d, Vh = numpy.linalg.linalg.svd(W.transpose())
    S = numpy.matrix(numpy.identity(3))
    if numpy.linalg.det(U) * numpy.linalg.det(Vh) < 0:
        S[2, 2] = -1

    rot = U * S * Vh
    rotmodel = rot * model_zerocentered

    dots = 0.0
    norms = 0.0
    for column in range(data_zerocentered.shape[1]):
        dots += numpy.dot(
            data_zerocentered[:, column].transpose(),
            rotmodel[:, column]
        )
        normi = numpy.linalg.norm(model_zerocentered[:, column])
        norms += normi * normi


    s = float(numpy.squeeze(dots).item() / norms)

    transGT = data.mean(1) - s * rot * model.mean(1)
    trans = data.mean(1) - rot * model.mean(1)

    model_alignedGT = s * rot * model + transGT
    model_aligned = rot * model + trans

    alignment_errorGT = model_alignedGT - data
    alignment_error = model_aligned - data

    trans_errorGT = numpy.sqrt(
        numpy.sum(numpy.multiply(alignment_errorGT, alignment_errorGT), 0)
    ).A[0]
    trans_error = numpy.sqrt(
        numpy.sum(numpy.multiply(alignment_error, alignment_error), 0)
    ).A[0]

    return rot, transGT, trans_errorGT, trans, trans_error, s


def plot_traj(ax, stamps, traj, style, color, label):
    stamps.sort()
    interval = numpy.median([s - t for s, t in zip(stamps[1:], stamps[:-1])])

    x = []
    y = []
    last = stamps[0]

    for i in range(len(stamps)):
        if stamps[i] - last < 2 * interval:
            x.append(traj[i][0])
            y.append(traj[i][1])
        elif len(x) > 0:
            ax.plot(x, y, style, color=color, label=label)
            label = ""
            x = []
            y = []
        last = stamps[i]

    if len(x) > 0:
        ax.plot(x, y, style, color=color, label=label)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='''
    This script computes the absolute trajectory error from the ground truth
    trajectory and the estimated trajectory.
    ''')

    parser.add_argument('first_file')
    parser.add_argument('second_file')
    parser.add_argument('--offset', default=0.0)
    parser.add_argument('--scale', default=1.0)
    parser.add_argument('--max_difference', default=20000000)
    parser.add_argument('--save')
    parser.add_argument('--save_associations')
    parser.add_argument('--plot')
    parser.add_argument('--verbose', action='store_true')
    parser.add_argument('--verbose2', action='store_true')

    args = parser.parse_args()

    first_list = associate.read_file_list(args.first_file, False)
    second_list = associate.read_file_list(args.second_file, False)

    matches = associate.associate(
        first_list, second_list,
        float(args.offset), float(args.max_difference)
    )

    if len(matches) < 2:
        sys.exit("Couldn't find matching timestamp pairs!")

    first_xyz = numpy.matrix(
        [[float(v) for v in first_list[a][0:3]] for a, b in matches]
    ).transpose()

    second_xyz = numpy.matrix(
        [[float(v) * float(args.scale)
          for v in second_list[b][0:3]] for a, b in matches]
    ).transpose()

    sorted_second_list = sorted(second_list.items())
    second_xyz_full = numpy.matrix(
        [[float(v) * float(args.scale)
          for v in sorted_second_list[i][1][0:3]]
         for i in range(len(sorted_second_list))]
    ).transpose()

    rot, transGT, trans_errorGT, trans, trans_error, scale = align(
        second_xyz, first_xyz
    )

    second_xyz_aligned = scale * rot * second_xyz + trans
    second_xyz_notscaled = rot * second_xyz + trans

    first_stamps = sorted(first_list.keys())
    first_xyz_full = numpy.matrix(
        [[float(v) for v in first_list[b][0:3]] for b in first_stamps]
    ).transpose()

    second_stamps = sorted(second_list.keys())
    second_xyz_full = numpy.matrix(
        [[float(v) * float(args.scale)
          for v in second_list[b][0:3]] for b in second_stamps]
    ).transpose()

    second_xyz_full_aligned = scale * rot * second_xyz_full + trans

    percent_compared = len(matches) / max(len(first_list), len(second_list)) * 100
    duration = 0

    for v in second_list.values():
        duration += float(v[7])

    effective_fps = len(second_list) / duration if duration > 0 else 0

    if args.verbose:
        print("compared_pose_pairs %d pairs" % len(trans_error))
        print("absolute_translational_error.rmse %f m" %
              numpy.sqrt(numpy.dot(trans_error, trans_error) / len(trans_error)))
        print("absolute_translational_error.mean %f m" % numpy.mean(trans_error))
        print("absolute_translational_error.median %f m" % numpy.median(trans_error))
        print("absolute_translational_error.std %f m" % numpy.std(trans_error))
        print("absolute_translational_error.min %f m" % numpy.min(trans_error))
        print("absolute_translational_error.max %f m" % numpy.max(trans_error))
        print("max idx: %i" % numpy.argmax(trans_error))
    else:
        print("RMS ATE RAW: %f\nScale: %f\nRMS ATE (Scale Corrected): %f" % (
            numpy.sqrt(numpy.dot(trans_error, trans_error) / len(trans_error)),
            scale,
            numpy.sqrt(numpy.dot(trans_errorGT, trans_errorGT) / len(trans_errorGT))
        ))
        print("percentage compared: %d" % percent_compared)
        print("processing fps: %f" % effective_fps)
        print("processing duration: %f" % duration)

    if args.verbose2:
        print("compared_pose_pairs %d pairs" % len(trans_error))
        print("absolute_translational_error.rmse %f m" %
              numpy.sqrt(numpy.dot(trans_error, trans_error) / len(trans_error)))
        print("absolute_translational_errorGT.rmse %f m" %
              numpy.sqrt(numpy.dot(trans_errorGT, trans_errorGT) / len(trans_errorGT)))
        
    
    
    # Append result to output file in csv format
    with open("output.txt", "a") as f:
        timestamp = datetime.now().strftime("%Y/%m/%d %H:%M:%S")
        f.write("%s,%s,%f,%f,%f,%f,%f,%f\n" % (
            timestamp,
            args.plot.split('.')[0],
            numpy.sqrt(numpy.dot(trans_error, trans_error) / len(trans_error)),
            scale,
            numpy.sqrt(numpy.dot(trans_errorGT, trans_errorGT) / len(trans_errorGT)),
            percent_compared,
            effective_fps,
            duration
        ))

    if args.plot:
        import matplotlib
        matplotlib.use('Agg')
        import matplotlib.pyplot as plt
        import matplotlib.pylab as pylab
        from matplotlib.patches import Ellipse
        fig = plt.figure()
        ax = fig.add_subplot(111)
        plot_traj(ax,first_stamps,first_xyz_full.transpose().A,'-',"black","ground truth")
        plot_traj(ax,second_stamps,second_xyz_full_aligned.transpose().A,'-',"blue","estimated")
        label="difference"
        for (a,b),(x1,y1,z1),(x2,y2,z2) in zip(matches,first_xyz.transpose().A,second_xyz_aligned.transpose().A):
            ax.plot([x1,x2],[y1,y2],'-',color="red",label=label)
            label=""
            
        ax.legend()
            
        ax.set_xlabel('x [m]')
        ax.set_ylabel('y [m]')
        plt.axis('equal')
        plt.savefig("plots/" + args.plot,format="pdf")