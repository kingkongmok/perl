#!/bin/bash - 
#===============================================================================
#
#          FILE: moveCompletedDownloadTask.sh
# 
#         USAGE: ./moveCompletedDownloadTask.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: kk (Kingkong Mok), kingkongmok AT gmail DOT com
#  ORGANIZATION: 
#       CREATED: 12/05/2013 03:36:34 PM CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
[ -r /etc/default/locale ] && . /etc/default/locale
[ -n "$LANG" ] && export LANG

set -x

trigger=
if [ -d ~/.mldonkey/torrents/seeded/ ] ; then
    find ~/.mldonkey/torrents/seeded/ -type f -iname \*torrent -exec rm -f "{}" \; 
    if [ $? == 0 ] ; then
        trigger=1 ;
    fi
fi

if [ $trigger ] ; then
    mv ~/Downloads/mldonkey/incoming/* ~/Downloads/
fi

