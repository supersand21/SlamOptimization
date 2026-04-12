#!/usr/bin/env bash
cd build
make stereo_inertial_euroc -j$(nproc)
cd ..

./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/V1_01_easy ./Examples/Stereo-Inertial/EuRoC_TimeStamps/V101.txt dataset-V101_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv f_dataset-V101_stereoi.txt --plot V101_stereoi.pdf

./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/V1_01_easy ./Examples/Stereo-Inertial/EuRoC_TimeStamps/V101.txt dataset-V101_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv f_dataset-V101_stereoi.txt --plot V101_stereoi.pdf

./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/V1_01_easy ./Examples/Stereo-Inertial/EuRoC_TimeStamps/V101.txt dataset-V101_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv f_dataset-V101_stereoi.txt --plot V101_stereoi.pdf

./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/V1_01_easy ./Examples/Stereo-Inertial/EuRoC_TimeStamps/V101.txt dataset-V101_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv f_dataset-V101_stereoi.txt --plot V101_stereoi.pdf

./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/V1_01_easy ./Examples/Stereo-Inertial/EuRoC_TimeStamps/V101.txt dataset-V101_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv f_dataset-V101_stereoi.txt --plot V101_stereoi.pdf


./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/MH_03_medium ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH03.txt dataset-MH03_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/MH_03_medium/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH03_stereoi.txt --plot MH03_stereoi.pdf

./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/MH_03_medium ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH03.txt dataset-MH03_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/MH_03_medium/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH03_stereoi.txt --plot MH03_stereoi.pdf

./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/MH_03_medium ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH03.txt dataset-MH03_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/MH_03_medium/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH03_stereoi.txt --plot MH03_stereoi.pdf

./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/MH_03_medium ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH03.txt dataset-MH03_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/MH_03_medium/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH03_stereoi.txt --plot MH03_stereoi.pdf

./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/MH_03_medium ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH03.txt dataset-MH03_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/MH_03_medium/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH03_stereoi.txt --plot MH03_stereoi.pdf


./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/MH_04_difficult ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH04.txt dataset-MH04_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/MH_04_difficult/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH04_stereoi.txt --plot MH04_stereoi.pdf

./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/MH_04_difficult ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH04.txt dataset-MH04_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/MH_04_difficult/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH04_stereoi.txt --plot MH04_stereoi.pdf

./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/MH_04_difficult ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH04.txt dataset-MH04_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/MH_04_difficult/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH04_stereoi.txt --plot MH04_stereoi.pdf

./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/MH_04_difficult ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH04.txt dataset-MH04_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/MH_04_difficult/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH04_stereoi.txt --plot MH04_stereoi.pdf

./Examples/Stereo-Inertial/stereo_inertial_euroc Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml ../datasets/MH_04_difficult ./Examples/Stereo-Inertial/EuRoC_TimeStamps/MH04.txt dataset-MH04_stereoi
python evaluation/evaluate_ate_scale3.py ../datasets/MH_04_difficult/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH04_stereoi.txt --plot MH04_stereoi.pdf


#./Examples/Monocular-Inertial/mono_inertial_euroc Vocabulary/ORBvoc.txt Examples/Monocular-Inertial/EuRoC.yaml ../datasets/V1_01_easy ./Examples/Monocular-Inertial/EuRoC_TimeStamps/V101.txt dataset-V101_monoi
#python evaluation/evaluate_ate_scale3.py ../datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv f_dataset-V101_monoi.txt --plot V101_monoi.pdf

#./Examples/Monocular-Inertial/mono_inertial_euroc Vocabulary/ORBvoc.txt Examples/Monocular-Inertial/EuRoC.yaml ../datasets/MH_03_medium ./Examples/Monocular-Inertial/EuRoC_TimeStamps/MH03.txt dataset-MH03_monoi
#python evaluation/evaluate_ate_scale3.py ../datasets/MH_03_medium/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH03_monoi.txt --plot MH03_monoi.pdf

#./Examples/Monocular-Inertial/mono_inertial_euroc Vocabulary/ORBvoc.txt Examples/Monocular-Inertial/EuRoC.yaml ../datasets/MH_04_difficult ./Examples/Monocular-Inertial/EuRoC_TimeStamps/MH04.txt dataset-MH04_monoi
#python evaluation/evaluate_ate_scale3.py ../datasets/MH_04_difficult/mav0/state_groundtruth_estimate0/data.csv f_dataset-MH04_monoi.txt --plot MH04_monoi.pdf


echo "Done!"
