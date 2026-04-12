#!/usr/bin/env bash
dataPath='../datasets/dataset-corridor4_512_16' # Dataset path


# Run corridor4 512x512
echo "Launching Corridor 4 with Stereo-Inertial sensor"
./Examples/Stereo-Inertial/stereo_inertial_tum_vi Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/TUM-VI.yaml ../datasets/dataset-corridor4_512_16/mav0/cam0/data ../datasets/dataset-corridor4_512_16/mav0/cam1/data Examples/Stereo-Inertial/TUM_TimeStamps/dataset-corridor4_512.txt Examples/Stereo-Inertial/TUM_IMU/dataset-corridor4_512.txt dataset-corridor4_512_stereoi

echo "Done!"
