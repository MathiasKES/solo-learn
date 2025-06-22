#!/bin/bash
#BSUB -J train_dino
#BSUB -q gpua10
#BSUB -n 8
#BSUB -gpu "num=2:mode=shared"
#BSUB -R "span[hosts=1]"
#BSUB -R "rusage[mem=8GB]"
#BSUB -W 24:00
#BSUB -oo gpuout/dino/train_dino_%J.out
#BSUB -eo gpuout/dino/train_dino_%J.err

module load cuda/12.8.1

# Activate conda environment
source /work3/s234843/init_project.sh

CUDA_VISIBLE_DEVICES=0,1 python solo-learn/main_pretrain.py \
    --config-path scripts/pretrain/custom/ \
    --config-name dino.yaml