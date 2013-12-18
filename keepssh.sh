#!/bin/bash - 
#===============================================================================
#
#          FILE: keepssh.sh
# 
#         USAGE: ./keepssh.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: https://liangsun.org/posts/how-to-solve-broken-pipe-message-in-ssh-session/
#        AUTHOR: kk (Kingkong Mok), kingkongmok AT gmail DOT com
#  ORGANIZATION: 
#       CREATED: 12/18/2013 11:25:42 AM CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
[ -r /etc/default/locale ] && . /etc/default/locale
[ -n "$LANG" ] && export LANG

i=0
while test 1==1
do
    remote_ip=YOUR_REMOTE_IP
    remote_user=YOUR_REMOTE_USER
    local_port=YOUR_LOCAL_PORT

    exist=`ps aux | grep $remote_user@$remote_ip | grep $local_port`
    #echo $exist
    if test -n "$exist"
    then
        if test $i -eq 0
        then
            echo "I'm alive since $(date)"
        fi  
        i=1
    else
        i=0
        echo "I died... God is bringing me back..."
        ssh $remote_user@$remote_ip -f -N -D 0.0.0.0:$local_port
    fi  
    sleep 1
done

