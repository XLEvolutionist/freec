#!/bin/bash
#OUTDIR=/group/jrigrp4/freec/output
#SBATCH -D /group/jrigrp4/freec/output
#SBATCH -o /group/jrigrp4/freec/logs/freec_out_log-%j.txt
#SBATCH -e /group/jrigrp4/freec/logs/freec_err_log-%j.txt
#SBATCH -J freec
#SBATCH --mem=10000
#SBATCH --cpus-per-task 10
##SBATCH --array=0

echo "Starting freec job: "
date

cmd="freec -conf ../config.txt"
echo $cmd
eval $cmd

echo "Job Ending: "
date
