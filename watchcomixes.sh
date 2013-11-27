#!/bin/bash - 
#===============================================================================
#
#          FILE: watchMovies.sh
# 
#         USAGE: ./watchMovies.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: kk (Kingkong Mok), kingkongmok AT gmail DOT com
#  ORGANIZATION: 
#       CREATED: 03/16/2012 12:52:04 PM CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
set -x


LOCATION=${1:-/home/kk/Pictures/.porn/hcomic}
OLDIFS=$IFS
IFS=$'\n'

FILEARRAY=( ` find "$LOCATION" -type f -size +10000 ` )
IFS=$OLDIFS
echo "${#FILEARRAY[@]}"

for (( CNTR=0; CNTR<${#FILEARRAY[@]}; CNTR+=1 )); do
    RANDOMNUMB=$(( $RANDOM % ${#FILEARRAY[@]} ))
    comix "${FILEARRAY[$RANDOMNUMB]}"
    #unset FILEARRAY[$RANDOMNUMB]
done


