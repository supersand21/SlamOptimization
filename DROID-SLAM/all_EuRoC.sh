#!/usr/bin/env bash

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/V1_01_easy --gt data/euroc_groundtruth/V1_01_easy.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot V101_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/V1_01_easy --gt data/euroc_groundtruth/V1_01_easy.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot V101_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/V1_01_easy --gt data/euroc_groundtruth/V1_01_easy.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot V101_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/V1_01_easy --gt data/euroc_groundtruth/V1_01_easy.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot V101_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/V1_01_easy --gt data/euroc_groundtruth/V1_01_easy.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/V1_01_easy/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot V101_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/MH_03_medium --gt data/euroc_groundtruth/MH_03_medium.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/MH_03_medium/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH03_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/MH_03_medium --gt data/euroc_groundtruth/MH_03_medium.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/MH_03_medium/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH03_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/MH_03_medium --gt data/euroc_groundtruth/MH_03_medium.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/MH_03_medium/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH03_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/MH_03_medium --gt data/euroc_groundtruth/MH_03_medium.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/MH_03_medium/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH03_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/MH_03_medium --gt data/euroc_groundtruth/MH_03_medium.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/MH_03_medium/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH03_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/MH_04_difficult --gt data/euroc_groundtruth/MH_04_difficult.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/MH_04_difficult/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH04_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/MH_04_difficult --gt data/euroc_groundtruth/MH_04_difficult.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/MH_04_difficult/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH04_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/MH_04_difficult --gt data/euroc_groundtruth/MH_04_difficult.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/MH_04_difficult/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH04_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/MH_04_difficult --gt data/euroc_groundtruth/MH_04_difficult.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/MH_04_difficult/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH04_stereoi.pdf

python evaluation_scripts/test_euroc.py --datapath data/euroc_datasets/MH_04_difficult --gt data/euroc_groundtruth/MH_04_difficult.txt --disable_vis
python myEvaluator/evaluate_ate_scale3.py data/euroc_datasets/MH_04_difficult/mav0/state_groundtruth_estimate0/data.csv track_output.txt  --plot MH04_stereoi.pdf

echo "Done!"

