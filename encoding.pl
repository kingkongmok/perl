#!/usr/bin/perl
#===============================================================================
#
#         FILE: test.pl
#
#        USAGE: ./test.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: http://stackoverflow.com/questions/627661/how-can-i-output-utf-8-from-perl
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 12/04/2013 11:10:59 AM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
#use Encode ;
#
#my $ascii_string  = '\u4e2d\u56fd\u53cd\u5783\u573e\u4fe1' ;
#
##my $title = Encode::encode("Windows-1252", $item->{title});
#
##use Encode ;
##use HTML::Entities;
#
##my $ascii_string  = '\u4e2d\u56fd\u53cd\u5783\u573e\u4fe1' ;
##print decode("ascii", $ascii_string) ;
#
##my $html_string = '\u4e2d\u56fd\u53cd\u5783\u573e\u4fe1' ;
##print Encode::encode_utf8(decode_entities($html_string));
#
##binmode STDOUT, ':utf8';
##print decode_entities($html_string);
#
#binmode(STDOUT, ":utf8");
#print $ascii_string ;

use utf8;

binmode(STDIN, ":encoding(utf8)");
my $str = 'Çirçös';
binmode(STDOUT, ":utf8");
print "$str\n" ;
