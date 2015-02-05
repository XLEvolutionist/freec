#!/bin/bash
#OUTDIR=/group/jrigrp4/freec/config
#SBATCH -D /group/jrigrp4/freec/config
#SBATCH -o /group/jrigrp4/freec/logs/freec_out_log-%j.txt
#SBATCH -e /group/jrigrp4/freec/logs/freec_err_log-%j.txt
#SBATCH -J freec
#SBATCH --mem=12000
#SBATCH --cpus-per-task 10
#SBATCH --array=0-20

files=(config_J*.conf)

echo "preserve run..."

echo "Starting freec job: "
date

cmd="freec -conf ${files[$SLURM_ARRAY_TASK_ID]}"
echo $cmd
eval $cmd

echo "Job Ending: "
date
