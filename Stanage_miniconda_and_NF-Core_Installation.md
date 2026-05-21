## NF-CORE LPWGS Analysis
This markdown file walks through the necessarry steps to setup NF-CORE on the university of Sheffield's Stanage HPC. The following is based on the University of Sheffield Bioinformatics Core's instructions for setting up NF-Core on your Stanage account. I have modified the instructions slightly, where commands are not up to date. I have also expanded this to specifically running [NF-CORE's Sarek pipeline](https://nf-co.re/sarek) for inferring copy number changes from low-pass whole genome sequencing (LPWGS) data.  

## 1) Installing Miniconda 
First login to Stanage using your username, and password, you may need to connect to the VPN to do this. If you have not accessed your HPC account before, you may need to enable DUO authentication as well.

```
# login - substitute "username" with your own username
ssh username@stanage.shef.ac.uk

# request a command line only interactive session - extra resources prevent issues building conda env later
srun --cpus-per-task=2 --mem=8G --pty bash -i
```

Download and install miniconda to your home directory: 

```
# navigate to user home directory
cd /users/$USER

# download Miniconda3-py39_23.5.2-0. At the time of writing, GCLIB on stanage is too old for the latest miniconda.

wget https://repo.anaconda.com/miniconda/Miniconda3-py39_23.5.2-0-Linux-x86_64.sh

# make the file executable
chmod +x Miniconda3-py39_23.5.2-0-Linux-x86_64.sh

# run the installer
bash Miniconda3-py39_23.5.2-0-Linux-x86_64.sh
```

The miniconda installer will now run and walk you through the install process. There are two **IMPORTANT** things you must take note of at this point:

1. You will have to overwrite the default install path when prompted by the miniconda installer to check the install path - the directory to which the install is attempted should be **`/users/$USER/miniconda`**.

```
Miniconda3 will now be installed into this location:
/<path>/<to>/miniconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/<path>/<to>/miniconda3] >>> /users/$USER/miniconda
```

**IF YOU HAVE NOT INSTALLED /users/$USER/miniconda AT THIS POINT YOU MUST REMOVE YOUR MIINICONDA3 AND START THE INSTALLATION SCRIPT AGAIN**

2. **DO NOT** initialize miniconda at the end of the install process when prompted as shown here:

```
Do you wish the installer to initialize Miniconda3
by running conda init? [yes|no]
[yes] >>> no
```

Once the installer has run, delete the installation script:

```shell
rm Miniconda3-py39_23.5.2-0-Linux-x86_64.sh
```

Now make a modules folder and module file:

```shell
# modules folder
mkdir /users/$USER/modules

# module file
nano /users/$USER/modules/miniconda
```

Copy and paste the below into the nano editor that opens upon running the final command. Note that this file is in Tcl not BASh, so environmental variable handing is different from the normal `$USER` for username.

```
#%Module1.0#####################################################################
##
## user miniconda module file
##
################################################################################

proc ModulesHelp { } {

  global version
  puts stderr "Makes a user's personal install of Miniconda available."

}

module-whatis "Makes a user's personal install of Miniconda available."

# module variables

set MINICONDA_DIR /users/$env(USER)/miniconda/bin

prepend-path PATH $MINICONDA_DIR
```

Use “Ctrl + O” to write-out the changes, hit “Return” to confirm the file name, and then “Ctrl + X” to close the nano editor.

Now run the following lines to make your personal modules available for loading immediately and whenever you login:

```shell
echo "module use /users/$USER/modules" >> ~/.bashrc
source ~/.bashrc
```

The last thing to note here is that you should not load the anaconda environmental module available to all HPC users and the personal miniconda module you have just made at the same time.

## 2) Install Nextflow and nf-core within a Conda Environment

### Load and Configure Conda

Run the following commands in the order provided and follow any prompts as appropriate:

```shell
# load the miniconda module
module load miniconda

# disable base environment auto-activation
conda config --set auto_activate_base false

# add the bioconda and conda-forge channels to conda configuration
conda config --add channels bioconda
conda config --add channels conda-forge

# set channel_priority to "strict"
conda config --set channel_priority strict

# ensure conda is up-to-date
# NB This can take some time, 20 minutes in testing 
conda update conda
```


## Create a Conda Analysis Environment with Nextflow and nf-core

Run the following commands in order and follow any prompts as appropriate:

```shell
# make the "nf_env" environment
conda create --name nf_env nextflow nf-core

# activate the environment
source activate nf_env

# ensure all packages are up-to-date
conda update --all
```

You can now test the install has worked by running the following:

```shell
# test the environment is working
nextflow info

# test functionality
nextflow run hello
```
If succesful, you should get something an output saying something like "NF-Core, version 1.2.3  hello, ciao, hola etc etc." 

When you are finished, you can deactivate your conda environment using the command `conda deactivate`

Should you wish to unload your personal miniconda module you can do so by running `module unload miniconda`. 
