#!/usr/bin/perl 
#===============================================================================
#
#         FILE: perlSourceFile.pl
#
#        USAGE: ./perlSourceFile.pl  
#
#  DESCRIPTION: test source function like bash
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 11/10/2013 08:19:33 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

source /tmp/test.sh || die "$!" ;
