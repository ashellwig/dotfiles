####################################################
# short_functions                                 ##
# @ashellwig                                      ##
# Purpose: Functions too small to deserve their   ##
#    own files                                    ##
####################################################

# Perform a Full Backup with Rsync
function full_backup() {
  sudo rsync '-aAX' '--info=progress2' '--stats' '--delete' "--exclude=/home/ahellwig/*" "--exclude=/dev/*" "--exclude=/proc/*" "--exclude=/sys/*" "--exclude=/tmp/*" "--exclude=/run/*" "--exclude=/mnt/*" "--exclude=/media/*" "--exclude=/lost+found/*" / /mnt/FULL_BACKUP
}

# Create a New Executable File
function new_exec_file() {
  print "This will create a new executable file."
  print "Please enter the filename, including extension"
  print "If the file exists, the command exits."
  read fileinputname
  if [[ ! -e ${fileinputname} ]]; then
    touch ${fileinputname}
    chmod +x ${fileinputname}
    vim ${fileinputname}
  elif [[ -e ${fileinputname} ]]; then
    print "File exists. Exiting."
    return 0
  fi
}

# Creates a new directory and `cd`s into it
function makenewdir() {
  print "Please name the directory to be created."
  print "If it already exists, the command will exit."
  read newdirmade
  if [[ ! -d ${newdirmade} ]]; then
    mkdir -p ${newdirmade}
    cd ${newdirmade}
  elif [[ -d ${newdirmade} ]]; then
    print "Directory already exists."
    return 0
  fi
}