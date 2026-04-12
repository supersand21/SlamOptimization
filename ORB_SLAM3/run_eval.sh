#!/usr/bin/env bash
dataPath='../datasets/dataset-corridor4_512_16' # Dataset path


# Run corridor4 512x512
echo "Evaluating Corridor 4 with Stereo-Inertial sensor"
python evaluation/evaluate_ate_scale3.py ../datasets/dataset-corridor4_512_16/mav0/mocap0/data.csv f_dataset-corridor4_512_stereoi.txt --plot corridor4_512_stereoi.pdf

echo "Done!"