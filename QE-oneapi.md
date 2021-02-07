# QE installation via OneAPI compiler & MKL


 This assumes that you have followed the OneAPI guide.   
 The paths are also assumed to be the same. 

1. Download and configure
```
cd $HOME/downloads
wget https://github.com/QEF/q-e/releases/download/qe-6.7.0/qe-6.7-ReleasePack.tgz

tar zxvf qe-6.7-ReleasePack.tgz
mv qe-6.7 $HOME/apps/

cd $HOME/apps/qe-6.7
. $HOME/apps/oneapi/setvars.sh

./configure --with-scalapack=intel MPIF90=mpiifort CC=mpiicc FC=ifort F77=mpiifort LIBDIRS="$MKLROOT/lib $I_MPI_ROOT/lib"
```

2. Replace
Find `FFLAGS` and `MPI_LIBS` and replace it with the problem values. Replace `kurt.rojas` with your username.

FFLAGS         = -O3 -assume byterecl -g -traceback  
MPI_LIBS       = -L/home/kurt.rojas/apps/oneapi/mpi/2021.1.1/lib -lmpi

3. Make
```
make -j4 all
```
4. Confirm success in `bin` directory.

5. Try it out.
REMEMBER: put `. $HOME/apps/oneapi/setvars.sh` in your script before running the pw

SUGGESTION on the script:

```
#!/bin/bash
#SBATCH --partition=batch
#SBATCH --qos=240c-1h_batch
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=1
#SBATCH --mem=24G
#SBATCH --exclude=saliksik-cpu-[01]
# - - - - - - - - - - - - - - - - - - - -

. $HOME/apps/oneapi/setvars.sh
export PATH=$PATH:$HOME/apps/qe-6.7/bin/

export OMP_NUM_THREADS=1
ulimit -s unlimited


. $HOME/apps/qe-6.7/PW/examples/example01/run_example
```

You will see the run_example output in `slurm.####` file in the current directory. (run in any directory you wish)


