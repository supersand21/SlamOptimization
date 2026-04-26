Optimization of different visual SLAM methods for my final year Dissertation

SLAM systems evaluated include:
- ORB SLAM 3 - https://github.com/UZ-SLAMLab/ORB_SLAM3
- Stereo Msckf - https://github.com/uoip/stereo_msckf
- DROID SLAM - https://github.com/princeton-vl/DROID-SLAM

Their respective repositories have been copied into the corresponding directories. These are included rather than ommited because they contain modifications and additions to their codebases that enable the experiments laid out in the Report to be performed. These modified files are listed bellow:
- ORB_SLAM3/Examples/Stereo-Inertial/stereo_inertial_euroc.cc
- ORB_SLAM3/Examples/Stereo-Inertial/EuRoC.yaml
- stereo_msckf/dataset.py
- stereo_msckf/feature.py
- stereo_msckf/msckf.py
- stereo_msckf/vio.py
- DROID-SLAM/droid_slam/droid.py
- DROID-SLAM/evaluation_scripts/test_euroc.py
- stereo_msckf/config.py

Evaluated using the EuRoC dataset: https://projects.asl.ethz.ch/datasets/euroc-mav/

Figure plotting and data processing can be found in Visuals.ipynb
Raw data from experiments can be found in Outputs
Already exported figured can be found in Outputs/Plots

SLAM tracking metrics for all systems are calculated with the evaluation script provided by ORB SLAM 3 at: ORB_SLAM3/evaluation/evaluate_ate_scale3.py

If you wish to run these SLAM systems follow the installation instructions provided on the relevant github pages linked above.

You can find the automated testing scripts in each SLAM system subdirectory called "all_EuRoC.sh"
