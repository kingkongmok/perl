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

#my $file = "/home/kk/Downloads/bill.utf8.csv" || die "$!";
#my $csv = Text::CSV->new ({ binary => 1, });
my $csv = Text::CSV->new({binary=>1});
#open my $io, "<", $file or die "$file: $!";

open FH, "< /home/kk/Downloads/bill.utf8.csv" || die "$!" ;
my@file=readline(FH);

#open OUT, "> /tmp/test.file";
#my @catalogs = ("天猫佣金（类目）",);

my %result;
my %ids;

my %catalogs = (
"T200P"=>"提现",
#"AS:收入金额（+元）";
#"售后维权(-) AS售后维权：天猫佣金"
"售后维权"=>"售后维权(-) AS售后维权：天猫佣金",
#"售后维权：代扣交易退回积分"
#"代扣返点积分"
#"代扣款（扣款用途：天猫佣金（类目）"=>"淘宝客佣金代扣款",
"天猫佣金"=>"淘宝客佣金代扣款",
#"天猫佣金（类目）"
#"线上支付服务费——信用卡快捷支付"
"代扣返点积分"=>"代扣交易退回积分",
);

foreach my $catalog ( keys %catalogs ) {

for ( @file ) {
    my $targetString;
    my $id;
    $_ =~ s/(?<=[^"])(\,)/",/g;
    $_ =~ s/(\,)(?=[^"])/,"/g;
    $_ =~ s/^"//;
    $_ =~ s/"$//;
    my @F = split/","/;
    if ( $F[11] ) {
        if ( $F[11] =~ /(\d+)\D+$/ ) {
            $ids{$catalog}=$1;
            $result{$ids{$catalog}}=$F[7];
            
        }
        $targetString=$F[11];
    }
    else {
        $targetString=$F[2]; 
    }
    if ( $targetString =~ /$catalog/ ) {
        $result{$catalogs{$catalog}}++ ;
    }
}

#-------------------------------------------------------------------------------
#  get id
#-------------------------------------------------------------------------------
    
#
#    if ($csv->parse($_)) {
#        my @columns = $csv->fields();
#
#        print @columns ;
##        foreach my $catalog ( @catalogs ) {
##            if ( $columns[11] =~ /\d/ ) {
##                print $columns[11] ;
###                if (  $columns[11] =~ /(\d+)\D+$/ ){
###                    #print $1, "\t", $columns[6] + $columns[7],"\n" ;
###                    print $columns[11] , "\n";
###                }
##            }
##        }
#    }
}



