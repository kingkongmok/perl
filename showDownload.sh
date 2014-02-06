#!/bin/bash - 
#===============================================================================
#
#          FILE: showDownload.sh
# 
#         USAGE: ./showDownload.sh 
# 
#   DESCRIPTION: show mldonkey donwload status;
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: kk (Kingkong Mok), kingkongmok AT gmail DOT com
#  ORGANIZATION: 
#       CREATED: 02/06/2014 11:21:23 AM CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
[ -r /etc/default/locale ] && . /etc/default/locale
[ -n "$LANG" ] && export LANG


echo vd | nc -q 1 localhost 4040 | perl -lane 'if(/\[B/){printf "%3s%5s%%%6s\t",@F[1,$#F-7,$#F-1]; print join" ",@F[6..$#F-8]}' | sort -n
