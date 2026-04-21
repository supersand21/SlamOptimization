Optimization of different visual SLAM methods for my final year Dissertation

SLAM systems evaluated include:
- ORB SLAM 3 - https://github.com/UZ-SLAMLab/ORB_SLAM3
- Stereo Msckf - https://github.com/uoip/stereo_msckf
- DROID SLAM - https://github.com/princeton-vl/DROID-SLAM

Evaluated using the EuRoC dataset: https://projects.asl.ethz.ch/datasets/euroc-mav/

Figure plotting and data processing can be found in Visuals.ipynb
Raw data from experiments can be found in Outputs
Already exported figured can be found in Outputs/Plots

SLAM tracking metrics for all systems are calculated with the evaluation script provided by ORB SLAM 3 at: ORB_SLAM3/evaluation/evaluate_ate_scale3.py

If you wish to run these SLAM systems follow the installation instructions provided on the relevant github pages linked above.

You can find the automated testing scripts in each SLAM system subdirectory called "all_EuRoC.sh"
