#!/bin/bash
## scheduler flags
# job name  >>> edit "sarek" for the name of the pipeline you are running e.g. rnaseq <<<
#SBATCH --job-name=SAREK

# request resources for the nextflow driver job
#SBATCH --cpus-per-task=1
#SBATCH --mem=8G
#SBATCH --time=08:00:00 #NB you may need to request more time if you have loads of samples

# send email >>> edit "username" <<<
#SBATCH --mail-user=username@sheffield.ac.uk
#SBATCH --mail-type=BEGIN,END,FAIL

# output log file
#SBATCH --output=nextflow.log

## load miniconda module and activate analysis environment

module purge
module load miniconda
source activate nf_env

## define and export variables
# prevent java vm requesting too much memory and killing run
export NXF_OPTS="-Xms1g -Xmx2g"
# path to singularity cache
export NXF_SINGULARITY_CACHEDIR="/users/$USER/.singularity"

# project name  >>> edit "project_name" so that it is the name of your project root directory <<<
PROJECT="lowpass_training_project_root"

# project directories  >>> edit the name of the "filestore" e.g. /mnt/parscratch/users <<<
PARAM_DIR="/mnt/parscratch/users/$USER/$PROJECT/params"
CONFIG_DIR="/mnt/parscratch/users/$USER/$PROJECT/config"

## run command  >>> edit "pipeline" and "version" <<<

nextflow run nf-core/sarek \
-r 3.4.0 \
-profile tuos_stanage \
-resume \
-params-file ${PARAM_DIR}/nf-params.json

