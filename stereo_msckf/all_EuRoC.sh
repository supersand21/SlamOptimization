#!/usr/bin/env bash

python vio.py --path ../datasets/V1_01_easy
python ../ORB_SLAM3/evaluation/evaluate_ate_scale3.py ../datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot V101_stereoi.pdf

python vio.py --path ../datasets/V1_01_easy
python ../ORB_SLAM3/evaluation/evaluate_ate_scale3.py ../datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot V101_stereoi.pdf


python vio.py --path ../datasets/MH_03_medium
python ../ORB_SLAM3/evaluation/evaluate_ate_scale3.py ../datasets/MH_03_medium/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH03_stereoi.pdf

python vio.py --path ../datasets/MH_03_medium
python ../ORB_SLAM3/evaluation/evaluate_ate_scale3.py ../datasets/MH_03_medium/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH03_stereoi.pdf


python vio.py --path ../datasets/MH_04_difficult
python ../ORB_SLAM3/evaluation/evaluate_ate_scale3.py ../datasets/MH_04_difficult/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH04_stereoi.pdf

python vio.py --path ../datasets/MH_04_difficult
python ../ORB_SLAM3/evaluation/evaluate_ate_scale3.py ../datasets/MH_04_difficult/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH04_stereoi.pdf
