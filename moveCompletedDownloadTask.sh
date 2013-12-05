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

#set -x

if [ -d ~/.mldonkey/torrents/seeded/ ] ; then
    if [ "$(ls -A ~/.mldonkey/torrents/seeded/)" ] ; then
        rm ~/.mldonkey/torrents/seeded/*torrent
    fi
fi

if [ "$(ls -A ~/Downloads/mldonkey/incoming/)" ] ; then
    mv ~/Downloads/mldonkey/incoming/* ~/Downloads/
fi

