#!/usr/bin/env bash
dataPath='../datasets/dataset-corridor4_512_16' # Dataset path


# Run corridor4 512x512
echo "Evaluating V1 01 Easy with Stereo-Inertial sensor"
python evaluation/evaluate_ate_scale3.py ../datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv f_dataset-V101_stereoi.txt --plot V101_stereoi.pdf

echo "Done!"
