#!/bin/sh 
#SBATCH --account=pinaki.sarder
#SBATCH --nodes=1 
#SBATCH --ntasks=1 
#SBATCH --mem=20gb
#SBATCH --time=72:00:00
#SBATCH --partition=gpu
#SBATCH --gpus=geforce
#SBATCH --output=testunetfolders.out 
#SBATCH --job-name='testunetfolders' 
ulimit -s unlimited 
module load conda 
conda activate wsi 
ls 
ml 
conda run python ./runHE2MT.py \
    --model unet256 \
    --epochs 10 \
    --lamda 130 \
    --monitor_freq 1epoch  \
    --dataroot /orange/pinaki.sarder/ahmed.naglah/data/testunetfolders/ \
    --experiment_id testunetfolders \
    --modelsave_freq 1 \
    --checkpoint_freq 1 

