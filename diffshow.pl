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
open my $output, ">> /home/kk/Downloads/output.txt" || die "$!" ;


sub getfooid {
my %hashfoo;
while ( <$fhfoo> ) {
#    my $id ;
#    next if /CAE_POINT/;
#    print $1 if /(?=HJCOM.*==)(\d+?)(?<=\s)/;
     #$hashfoo{$1}++ if /T200P(\d+)\s/;
     if ( /T200P(\d+)\s/ ){
        $hashfoo{$1}++;
        next ;
     };
     #$hashfoo{$1}++ if /HJCOM.*==(\d+)\s/;
     if (  /HJCOM.*==(\d+)\s/ ) {
        $hashfoo{$1}++ ;
        next ;
     }
    print $output "foo input error:\t", $_ ;
}


#-------------------------------------------------------------------------------
#  print the hash
#-------------------------------------------------------------------------------
#while ( my ($k,$v) = each %hashfoo ) {
##    print $k , "\n" if $v == 1 ;
#    print $k , "\t", $v,  "\n";
#}
return %hashfoo
} ## --- end sub getfooid

my%fooresult = &getfooid ;



sub getbarid {
my %hashbar ;
while ( <$fhbar> ) {
    #$hashbar{$1}++ if /^(\d+)\s/;
    if ( /^(\d+)\s/ ) {
        $hashbar{$1}++ ;
        next ;
    }
    print $output "foo input error:\t", $_ ;
}
#-------------------------------------------------------------------------------
#  print the hash
#-------------------------------------------------------------------------------
#while ( my ($k, $v) = each %hashbar ) {
#    print $k , "\t", $v,  "\n";
#}
    return %hashbar;
} ## --- end sub getbarid

my%barresult = &getbarid ;






sub difftwofile {
    my	%hashfoo = %{shift()};
    my %hashbar = %{shift()} ;

    print keys %hashbar ;

    return ;
} ## --- end sub difftwofile

&difftwofile(\%fooresult, \%barresult);
