Here we walk through setting up your project directory and executing NF-Core's Sarek pipeline. 

## 1 setting up project directory. 
NF-Core pipelines generate lots of intermediate files, and hence storage quickly becomes limiting in your home directory. 
Thankfully, Stanage has a 'parscratch' directory in which there are no per-user storage limits. NB the parscratch directory
is not backed up, so once you've analysed your data. Copy the output to e.g. your research group's shared area and delete all files from Stanage's parscratch. 

To make life easy for yourself when you come to run NF-CORE pipelines at any point in the future, navigate into your mnt/parscratch directory, 
```
cd /mnt/parscratch/users/$USER
```
make a new projectroot, each time you perform a new nf-core analysis with the same 5 subdirectories. We NF-core will use these subdirectories to access/write various bits of data
```
mkdir -p lowpass_training_project_root/{config,params,sample_sheet,script}
```
We now need to write a params json file file to tell nf-core what tools to use. each time you run the pipline on a new dataset, you will need to update the filepaths below so that nf-core knows i) where to look for your raw data  and ii) where to write your output to. 
open up a text editor for your params file 

```
nano lowpass_training_project_root/
```
and paste in the following. *NB change the "email" line to your own email address. Also make sure to specify absolute filepaths for input and output directories*
```
{
    "input": "/mnt/parscratch/users/$USER/lowpass_training_project_root/",
    "outdir": "/mnt/parscratch/users/$USER/lowpass_training_project_root/outdir",
    "trim_fastq": true,
    "save_mapped": true,
    "save_output_as_bam": true,
    "genome": "GATK.GRCh38",
    "tools": "controlfreec",
    "email": "YOUREMAILADDRESSHERE"
}
```
then write out the changes with cntrl+o

You will also need a samplesheet so that NF-CORE knows which file is which
