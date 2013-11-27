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


LOCATION=${1:-/home/kk/Videos/.porn}
ScriptVersion="1.0"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
function usage ()
{
	cat <<- EOT

  Usage :  ${0##/*/} [options] [--] 

  Options: 
  -h|help       Display this message
  -v|version    Display script version
  -j            japan movies
  -u            us movies
  -a            amimations

	EOT
}    # ----------  end of function usage  ----------

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hvaju" opt
do
  case $opt in

    h|help     )  usage; exit 0   ;;
    a     )     LOCATION=/home/kk/Videos/.porn/anime; break   ;;
    j     )     LOCATION=/home/kk/Videos/.porn/asia; break   ;;
    u     )     LOCATION=/home/kk/Videos/.porn/us; break   ;;

    v|version  )  echo "$0 -- Version $ScriptVersion"; exit 0   ;;

    \? )  echo -e "\n  Option does not exist : $OPTARG\n"
          usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))


OLDIFS=$IFS
IFS=$'\n'

FILEARRAY=( ` find "$LOCATION" -type f -size +10000 ` )
IFS=$OLDIFS
echo "${#FILEARRAY[@]}"

for (( CNTR=0; CNTR<${#FILEARRAY[@]}; CNTR+=1 )); do
    RANDOMNUMB=$(( $RANDOM % ${#FILEARRAY[@]} ))
    mplayer -fs "${FILEARRAY[$RANDOMNUMB]}"
    unset FILEARRAY[$RANDOMNUMB]
done


