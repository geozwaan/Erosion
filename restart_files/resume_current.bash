#!/bin/bash
if [[ $# -ne 9 ]] ; then
 echo " "
 echo "$0: error, argument number $#"
 echo " "
 echo "usage:"
 echo "bash BASHFILE INITIALCOUNT MAXCOUNT folder_name prmfile(without .prm) jobname outputfolder walltime(minutes) n_nodes n_cores_per_node:"
 echo " "
 echo "example:"
 echo "blogin> bash $0 0 4 $(pwd) example jobname outputfolder 720 1 96"
 echo "blogin> sbatch runaspect_000"
 exit 1
fi

bashfile=$0
counter=$1
maxcou=$2
directory=$3
prmfile=$4
jobname=$5
output_folder=$6
total_time=$(($7*60))   ## Convert minutes to seconds ##
nodes=$8
corespernode=$9

nextcou=$(($counter + 1))
countstr=$(printf "%03d" $counter)
pbsfile=${jobname}_${countstr}

## Get a second file name so we can check the previous run with grep ##
pbsfile2=$pbsfile
if [ $counter != 0 ]; then
  old_counter=$(($counter - 1))
  countstr2=$(printf "%03d" $old_counter)
  pbsfile2=${jobname}_${countstr2}
fi  

## this is the jobscript for the initial run ##
cat <<EOF > $pbsfile
#!/bin/bash
#SBATCH -t $(($total_time/3600)):$(($total_time%3600/60)):$(($total_time%60))
#SBATCH -N $nodes
#SBATCH --tasks-per-node $corespernode
#SBATCH -p standard96
###SBATCH -A bbpsbrun
#SBATCH -J ${jobname}_${countstr}
#SBATCH --output=%x_%j.out
#SBATCH -A bbp00039
set -ue

## Don't bother with these if it's the first run ##
if [ $counter != 0 ]; then
  
  ## Check if a resume file exists for this model ##
  if [ -f $PWD/$output_folder/restart.resume.z ]; then
     echo "Resume exists. Continue."
  else
     echo "No resume model exists, exiting script."
     exit 1
  fi
  
  ## Check if the model finished or not ##
  if grep -q "criterion: end time" $pbsfile2*.out; then
    echo "Model finished (based on previous *.out file), exiting script."
    exit 1
  else
    echo "Model has not finished. Continue."
  fi
  
  ## Check if the model crashed ##
  if grep -q "ERROR" $pbsfile2*.out || grep -q "error" $pbsfile2*.out; then
    echo "Model crashed (based on previous *.out file), exiting script."
    exit 1
  else
    echo "Model has not crashed. Continue."
  fi
  
fi

# run aspect
cd $directory
mpirun --map-by socket:pe=$OMP_NUM_THREADS /home/bbkcygne/software/aspect/build_release_dev_f747113_dealiidev_24062022/aspect $PWD/$prmfile.prm  &

## Check whether or not the model is still running every 120 seconds. ##
## If it finishes or crashes, kill the script. ##
for i in {1..$((($total_time-100)/120))}
do

  sleep 120
  ## Check if the model finished or not ##
  if grep -q "criterion: end time" $pbsfile*.out; then
    echo "Model finished (based on *.out file), exiting script."
    exit 1
  fi

  ## Check if the model crashed ##
  if grep -q "ERROR" $pbsfile*.out || grep -q "error" $pbsfile*.out; then
    echo "Model has crashed, exiting script."
    exit 1
  fi

done

## If the model never stopped, kill it 100 sec before end time ##
echo "Terminating run"
kill %1

## prepare next run file and submit it to queue ##
if [[ $nextcou -le $maxcou ]] ; then
 cd $directory
 pbstmp=\$(bash ./$bashfile $nextcou $maxcou $directory $prmfile $jobname $output_folder $((total_time/60)) $nodes $corespernode)
 sbatch \$pbstmp
fi
EOF

echo $pbsfile

