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
use CGI;
use CGI::Carp qw/fatalsToBrowser/;
use utf8;
use Encode;

my $q = new CGI;
    &convertfile ;
    print $q->redirect('./result.csv');
#        "Content-Type:application/octet-stream; name=\"FileName\"\r\n";
#        "Content-Disposition: attachment; filename=\"FileName\"\r\n\n";
    

sub convertfile {
open FH, "<:encoding(gbk)", "/tmp/billconvertinput.csv" || die "$!" ;
my@file=readline(FH);
open OUT, "> /home/kk/public_html/convertbill/result.csv";

my %result;

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


    for ( @file ) {
        my $targetString;
        my $contnumb;
        $_ =~ s/(?<=[^"])(\,)/",/g;
        $_ =~ s/(\,)(?=[^"])/,"/g;
        $_ =~ s/^"//;
        $_ =~ s/"$//;
        my @F = split/","/;
        foreach my $catalog ( keys %catalogs ) {
            if ( $F[11] =~ /$catalog/ ) {
                # get id from column 11.
                if ( $F[11] =~ /(\d+)\D+$/ ) {
                    my$contnumb=$1;
                    # put column6.7 to result hash.
                    if ( exists $result{$contnumb}{$catalog} ) {
                        $result{$contnumb}{$catalog}=$F[6]+$F[7]+$result{$contnumb}{$catalog};
                    }
                    else {
                        $result{$contnumb}{$catalog}=$F[6]+$F[7] ;
                    }
                    last ;
                }
            }
            elsif ($F[2] =~ /$catalog/) {
                if ( $F[2] =~ /T200P(\d+)/ ) {
                    my$contnumb=$1;
                    if ( exists $result{$contnumb}{$catalog} ) {
                        $result{$contnumb}{$catalog}=$F[6]+$F[7]+$result{$contnumb}{$catalog};
                    }
                    else {
                        $result{$contnumb}{$catalog}=$F[6]+$F[7];
                    }
                    last ;
                }
            }
        }

}



#use Data::Dumper; 
#print Dumper(\%result);


#foreach my $catalog (sort keys%catalogs ) {
#    print  "\t", $catalogs{$catalog} ;
#}
#print  "\n";
#foreach my $contnumb (sort keys%result ) {
#    print  $contnumb ;
#    foreach my $catalog ( sort keys%catalogs ) {
#        if ( defined $result{$contnumb}{$catalog} ) {
#            print  "\t", $result{$contnumb}{$catalog};
#        }
#        else {
#            print  "\t0";
#        }
#    }
#    print  "\n";
#}


foreach my $catalog (sort keys%catalogs ) {
    print OUT ",", Encode::encode('gbk',$catalogs{$catalog}) ;
}
print OUT "\n";
foreach my $contnumb (sort keys%result ) {
    print OUT $contnumb ;
    foreach my $catalog ( sort keys%catalogs ) {
        if ( defined $result{$contnumb}{$catalog} ) {
            print OUT ",", $result{$contnumb}{$catalog};
        }
        else {
            print OUT ",0";
        }
    }
    print OUT "\n";
}

}
