Here we walk through setting up your project directory and executing NF-Core's Sarek pipeline. 

## 1 setting up project directory. 
NF-Core pipelines generate lots of intermediate files, and hence storage quickly becomes limiting in your home directory. 
Thankfully, Stanage has a 'parscratch' directory in which there are no per-user storage limits. NB the parscratch directory
is not backed up, so once you've analysed your data. Copy the output to e.g. your research group's shared area and delete all 
files from Stanage's parscratch. 
