#!/usr/bin/perl
#===============================================================================
#
#         FILE: changeCol.pl
#
#        USAGE: ./changeCol.pl  
#
#  DESCRIPTION:
#BJ30 26
#BJ30 24
#BJ30 63
#BJ30 70
#SH41 21
#SH41 30
#SH41 25
#SH41 25
#SD15 34
#SD15 46
#SD15 20
#SD15 34
#TJ20 23
#TJ20 32
#TJ20 31
#TJ20 35
#
#目标文本：
#
#BJ30  SH41  SD15  TJ20
#26    21    34    23
#24    30    46    32
#63    25    20    31
#70    25    34    35
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 12/11/2013 05:25:47 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

my$string = "BJ30 26
BJ30 24
BJ30 63
BJ30 70
SH41 21
SH41 30
SH41 25
SH41 25
SD15 34
SD15 46
SD15 20
SD15 34
TJ20 23
TJ20 32
TJ20 31
TJ20 35
";

my@array=split"\n",$string ;
my %hash ;

foreach my$line ( @array ) {
    my($k,$v)=split"\s+",$line;
        print "$k\t$v\n" ;
}
