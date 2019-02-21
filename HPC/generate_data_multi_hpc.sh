#!/bin/bash

#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=4:mem=1gb
#PBS -J 0-29

date

MODE=multi # or 'binary'

DIRSOFT=/home/mfumagal/Software
DIRDATA=$EPHEMERAL/Data/ImaGene.$MODE

EACH=10
A=$(($PBS_ARRAY_INDEX / $EACH))
model=$(( A + 1 ))
repetition=$(( $(( $PBS_ARRAY_INDEX - $(( A*EACH )) )) + 1 ))

FNAME=$DIRDATA/Simulations$repetition.Epoch$model
echo $FNAME
mkdir -p $FNAME
bash $DIRSOFT/ImaGene/simulate.sh $DIRSOFT/msms/lib/msms.jar $FNAME $model $MODE

date

