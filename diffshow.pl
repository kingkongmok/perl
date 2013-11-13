#!/usr/bin/perl
#===============================================================================
#
#         FILE: diffshow.pl
#
#        USAGE: ./diffshow.pl  
#
#  DESCRIPTION: 海燕要求,diff two files, output also twofiles, list the differences. 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 11/13/2013 11:14:11 AM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

open my $fhfoo, "< /home/kk/Downloads/foo.csv" || die "$!" ;
open my $fhbar, "< /home/kk/Downloads/bar.csv" || die "$!" ;

my %hashfoo;

while ( <$fhfoo> ) {
#    my $id ;
#    next if /CAE_POINT/;
#    print $1 if /(?=HJCOM.*==)(\d+?)(?<=\s)/;
     $hashfoo{$1}++ if /T200P(\d+)\s/;
     $hashfoo{$1}++ if /HJCOM.*==(\d+)\s/;
}


while ( my ($k,$v) = each %hashfoo ) {
#    print $k , "\n" if $v == 1 ;
    print $k , "\t", $v,  "\n";
}

