#!/bin/bash - 
#===============================================================================
#
#          FILE: mlcupload.sh
# 
#         USAGE: ./mlcupload.sh 
# 
#   DESCRIPTION: use gpg encrypt the mlocate.db and put it into dropbox.
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: kk (Kingkong Mok), kingkongmok AT gmail DOT com
#  ORGANIZATION: 
#       CREATED: 12/18/2013 08:57:10 AM CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
[ -r /etc/default/locale ] && . /etc/default/locale
[ -n "$LANG" ] && export LANG

LOCATEFILE=/var/lib/mlocate/mlocate.db
DROPXBOXLOCATE=
DOCLOCATION=/home/kk/Documents/personal
DOCFILE=/home/kk/Documents/personal/mlocate.db
DOCGPGFILE=/home/kk/Documents/personal/mlocate.db.gpg


#if [ ! "$(id $USER | grep mlocate)" ] ; then
#    echo "please add user to the locate group."
#    exit 73 ;
#fi

if [ "$(ps -ef | grep [u]pdatedb)" ] ; then
    echo "mlodatedb uplodateing please wait." ;    
    exit 74;
fi


if [ -d $DOCLOCATION ] ; then
    sudo cp -a $LOCATEFILE $DOCLOCATION &&\
    sudo chown ${USER}:${USER} $DOCFILE &&\
    gpg -e -r kingkongmok@gmail.com $DOCFILE &&\
    shred -u $DOCFILE &&\
    mv $DOCGPGFILE ~/Dropbox/Documents/personal/
fi


