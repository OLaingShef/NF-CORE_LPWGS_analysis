# NF-CORE_LPWGS_analysis

This repository contains the necessarry code to perform low-pass whole genome sequencing analysis on stanage, using nf-core's sarek pipeline (specifically using control-freec for CNV calling)

If this is your first time using an nf-core pipeline on stanage. you will need to install miniconda and nf-core before you can perform any analysis. details here 

This assumes you already have your raw data on stanage. For information on transferring data to and from stanage, please see the university's [documentation](https://docs.hpc.shef.ac.uk/en/latest/hpc/transferring-files.html#gsc.tab=0) on this. I reccomend that, for purposes of analysis, you copy your raw data to your personal folder in /mnt/parscratch to avoid storage issues. Once you've completed your analysis, transfer any output you wish to keep to e.g. your research group's shared area, then remove from stanage.  

[1) Install miniconda and nextflow](https://github.com/OLaingShef/NF-CORE_LPWGS_analysis/blob/main/Stanage_miniconda_and_NF-Core_Installation.md)

[2) Running variant calling with NF-CORE's Sarek Pipeline](https://github.com/OLaingShef/NF-CORE_LPWGS_analysis/blob/main/Sarek_pipeline_setup_and_execution.md)

3) [Inerpreting and plotting data]
