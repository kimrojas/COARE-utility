# OneAPI setup on COARE

This is a setup guide for the OneAPI in COARE.  
Due to the recent retirement of Intel Parallel studio, [OneAPI](https://software.intel.com/content/www/us/en/develop/tools/oneapi.html) is now goto package for the intel compilers and math kernel library (MKL).  
For more information, visit https://software.intel.com/content/www/us/en/develop/tools/oneapi.html

MAIN DOWNLOAD WEBSITE: https://software.intel.com/content/www/us/en/develop/tools/oneapi/all-toolkits.html

> NOTE: The downloads are free but requires an intel developer account. Its free to register!  



## A. OneAPI Base Toolkit

1. Log-in to COARE (make sure its a new login instance and no modules are loaded)
2. Create a `downloads` and `apps` directory to hold our downloads and locally installed programs, respectively.  
```
mkdir $HOME/downloads
mkdir $HOME/apps
```
3. Dowload the **OneAPI Base Toolkit**
```
cd $HOME/downloads
wget https://registrationcenter-download.intel.com/akdlm/irc_nas/17431/l_BaseKit_p_2021.1.0.2659_offline.sh
```
4. Install the **OneAPI Base Toolkit** (Grab some coffee, takes a long while)
> IMPORTANT !!   
> We will be installing the OneAPI to the `apps` directory.  
> In one of the steps, you will be asked to `Install` or `Custom Install`: CHOOSE `Custom Install`.
> - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
>
> **set the installation path to:    /home/kurt.rojas/apps/oneapi     (change kurt.rojas to your username)**
>
> - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
> In any other step, just `accept` and `skip`: You might see OpenCL problems, just ignore.  
```
sh l_BaseKit_p_2021.1.0.2659_offline.sh
```
5. Check if installation is successfull.  
There should be a `$HOME/apps/oneapi` directory containing many things. 

For reference, OneAPI Base tootlkit may be manually downloaded from this [page](https://software.intel.com/content/www/us/en/develop/tools/oneapi/base-toolkit/download.html).



## B. OneAPI High-performance computing (HPC) Toolkit

1. Make sure **SECTION A** is done.
2. The current terminal should be *either* a newly logged in one (without loaded modules) OR a continuation from section A. 
3. Download the **OneAPI HPC Toolkit**
```
cd $HOME/downloads
wget https://registrationcenter-download.intel.com/akdlm/irc_nas/17427/l_HPCKit_p_2021.1.0.2684_offline.sh 
```
4. Install the **OneAPI HPC Toolkit**
> IMPORTANT !!
> In one of the prompts, the installation path or directory will be shown.
> Make sure it is the same with the one in section A
> Just accept.
```
sh l_HPCKit_p_2021.1.0.2684_offline.sh
```

For reference, OneAPI Base tootlkit may be manually downloaded from this [page](https://software.intel.com/content/www/us/en/develop/tools/oneapi/hpc-toolkit/download.html)



## C. Confirm installation success
1. Go to directory
```
cd $HOME/apps/oneapi
```
2. Set environment variables
```
. setvars.sh
```
3. Check if successful
```
which mpirun

which ifort

which icc

which mpiifort

echo $MKLROOT
```


<!--
## D. SETUP DFTI (Fourier transform interface)
1. make sure `. setvars` was ran
2. goto directory `cd $MKLROOT/include`
3. 
-->


## E. (optional) Module setup for OneAPI
If you want to continue using `module` for your codes, this is your thing.  
1. Create and declare module files
```
mkdir $HOME/apps/oneapi-modulefiles
cd $HOME/apps/oneapi
sh modulefiles-setup.sh --output-dir=$HOME/apps/oneapi-modulefiles
echo 'export MODULEPATH=$MODULEPATH:$HOME/apps/oneapi-modulefiles' >> ~/.bash_profile
```
2. Check modules if loaded properly. 
```
cd 
module avail
```
  

