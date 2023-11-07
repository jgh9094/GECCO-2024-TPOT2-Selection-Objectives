#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH -t 00:10:00
#SBATCH --mem=100G
#SBATCH --mem-per-cpu=10G
#SBATCH --job-name=tpot2

module load Conda/3
conda activate tpot2-env
pip install -e ../../../tpot2/

srun -u python $HOME/Repos/GECCO-2024-TPOT2-Selection-Objectives/Source/main.py \
--n_jobs 10 \
--savepath ../Results/ \
--num_reps 10 \
--sel_scheme 0 \