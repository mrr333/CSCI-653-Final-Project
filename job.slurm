#!/bin/bash 
#SBATCH -J NAQMD-600
#SBATCH --ntasks=128
#SBATCH --cpus-per-task=1
#SBATCH --time=336:00:00
#SBATCH --mem=0             # utilize all of the node’s RAM memory
##SBATCH --mail-user=aaditya@usc.edu
##SBATCH --mail-type=all   
#SBATCH --account=priyav_216
#SBATCH --exclusive
#SBATCH --partition=priya

module purge
module load intel-oneapi/2021.1-beta09

#export LD_LIBRARY_PATH=/scratch2/aaditya/SOFTWARE/QXMD-INTEL-ONE-API/fftw-3.3.8/build_intel-oneapi/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/project/anakano_81/ruruma/01.2021Summer_CIPS-Excutable_QXMD/QXMD-INTEL-ONE-API/fftw-3.3.8/build_intel-oneapi/lib:$LD_LIBRARY_PATH

export OMP_NUM_THREADS=1

ulimit -s unlimited

cd ${SLURM_SUBMIT_DIR}
srun --mpi=pmi2 -n 128 ./qxmdmpi |tee log_OPT
