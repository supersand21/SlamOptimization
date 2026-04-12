#!/usr/bin/env bash
dataPath='../datasets/dataset-corridor4_512_16' # Dataset path


# Run corridor4 512x512
echo "Launching Vicon Room 1, 01 with Stereo-Inertial sensor"
./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/V1_01_easy ./Examples/Stereo-Inertial/EuRoC_TimeStamps/V101.txt dataset-V101_stereoi
echo "Done!"