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
use Text::CSV;

my $file = "/home/kk/Downloads/bill.utf8.csv" || die "$!";
#my $csv = Text::CSV->new ({ binary => 1, });
my $csv = Text::CSV->new({ binary => 1, });
open my $io, "<", $file or die "$file: $!";

#while (my $row = $csv->getline($io)) {
#    my @fields = @$row;
#    print @fields ;
#}

while ( <$io> ) {
    $_ =~ s/(?<=[^"])(\,)/",/g;
    $_ =~ s/(\,)(?=[^"])/,"/g;
    if ($csv->parse($_)) {
        my @columns = $csv->fields();
        if (  $columns[11] =~ /(\d+)\D+$/ ){
            #print $1, "\t", $columns[6] + $columns[7],"\n" ;
            print $columns[11] , "\n";
        }
    }
}

