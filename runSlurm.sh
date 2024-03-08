#!/bin/sh 
#SBATCH --account=ahmed.naglah 
#SBATCH --nodes=1 
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=16gb 
#SBATCH --partition=hpg-default 
#SBATCH --time=72:00:00 
#SBATCH --output=runHE2MT.out 
#SBATCH --job-name='runHE2MT' 
ulimit -s unlimited 
module load conda 
conda activate wsi 
ls 
ml 
conda run python ./runHE2MT.py \
    --model condGAN1024 \
    --epochs 6 \
    --lamda 130 \
    --monitor_freq 1epoch  \
    --dataroot ./data/ \
    --experiment_id exp1 \
    --modelsave_freq 1 \
    --checkpoint_freq 1 
