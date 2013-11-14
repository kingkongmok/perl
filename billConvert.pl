#!/usr/bin/perl
#===============================================================================
#
#         FILE: billConvert.pl
#
#        USAGE: ./billConvert.pl  
#
#  DESCRIPTION:  春丽姐 convert taobao's bill to a form
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 10/24/2013 04:39:56 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

sub openfile {
    open my $output , "> /home/kk/Downloads/billConvert_output.txt";
    open FH,"< /home/kk/Downloads/bill.utf8.csv" || die "$!";
    my @filelines = readline(FH);
    return @filelines;
} ## --- end sub openfile

sub splitcsv {
    my @file = @{shift()};
    foreach my $line ( @file ) {
        if ( $line =~ /^"(.*)"$/ ) {
            my @F = split /","/,$1 ;
            if ( $F[10] ) {
                print $F[10];
            }
        }
    }
    
    return ;
} ## --- end sub splitcsv

my @filelines = &openfile ;
my @splitedfile = &splitcsv(\@filelines) ;



#my %hash ;
#
#    my $linecount;
#    while (<$fou>) {
#        if ($csv->parse($_)) {
#            my @columns = $csv->fields();
#            $linecount++;
#            if (  $columns[11] =~ /(\d+)\D+$/ ){
##                print $1, "\t", $columns[6] + $columns[7],"\n" ;
#                if ( exists $hash{$1} ) {
#                    $hash{$1} = sprintf("%s\t%.2f",$hash{$1} ,  $columns[6] + $columns[7]) ;     
#                } else {
#                    $hash{$1} = $columns[6] + $columns[7] ; 
#                }
#            } else {
#                if ( $columns[2] =~ /T200P(\d+)/ ) {
##                    print $1, "\t", $columns[6] + $columns[7],"\n" ;
#                if ( exists $hash{$1} ) {
#                    $hash{$1} = sprintf("%s\t%.2f",$hash{$1} ,  $columns[6] + $columns[7]) ;     
#                } else {
#                    $hash{$1} = $columns[6] + $columns[7] ; 
#                }
#                }
#            }
#        } else {
#            my $err = $csv->error_input;
#            print "Failed to parse line: $err";
#        }
#    }
#    close CSV;
#
#
#
