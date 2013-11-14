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

#use strict;
use warnings;

    use Text::CSV;

    my $file = '/home/kk/Downloads/bill.csv';
my %hash ;
    #my $csv = Text::CSV->new({binary=>1});
    my $csv = Text::CSV->new();

open $output , "> /home/kk/Downloads/test.txt";
    open (CSV, "<:encoding(gbk)", $file) or die $!;
    my $linecount;
    while (<CSV>) {
        if ($csv->parse($_)) {
            my @columns = $csv->fields();
            $linecount++;
            if (  $columns[11] =~ /(\d+)\D+$/ ){
#                print $1, "\t", $columns[6] + $columns[7],"\n" ;
                if ( exists $hash{$1} ) {
                    $hash{$1} = sprintf("%s\t%d",$hash{$1} ,  $columns[6] + $columns[7]) ;     
                } else {
                    $hash{$1} = $columns[6] + $columns[7] ; 
                }
            } else {
                if ( $columns[2] =~ /T200P(\d+)/ ) {
#                    print $1, "\t", $columns[6] + $columns[7],"\n" ;
                if ( exists $hash{$1} ) {
                    $hash{$1} = sprintf("%s\t%d",$hash{$1} ,  $columns[6] + $columns[7]) ;     
                } else {
                    $hash{$1} = $columns[6] + $columns[7] ; 
                }
                }
            }
        } else {
            my $err = $csv->error_input;
            print "Failed to parse line: $err";
        }
    }
    close CSV;


    while ( my ($k,$v) = each %hash ) {
        print $output "$k\t$v\n" ;
    }

print $linecount ;
