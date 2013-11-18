#!/usr/bin/perl
#===============================================================================
#
#         FILE: cookie.pl
#
#        USAGE: ./cookie.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 10/23/2013 12:14:25 PM
#     REVISION: ---
#===============================================================================

#use strict;
#use warnings;
use Storable qw/freeze/;
use CGI::Carp qw/fatalsToBrowser/;

use CGI;
use CGI::Cookie;

my %prefs = (
size=>"big",
colors=>"red",
address=>"guangzhou",
);

my $c = CGI::Cookie->new(
-name=>"kk",
-value=>\%prefs,
#-expires=>"+1d",
#-domain=>".kk.igb",
#-path=>"/",
#-secure=>"0",
);

my $cookiefetch = CGI::Cookie->fetch;

my $q = new CGI;

if ( $cookiefetch ) {
    print $q->header();
    while ( my($k,$v)=each$cookiefetch ) {
        print "$k" ;
        print "\nyou like $v\n\n" ;
    }
} else {
    print $q->header(-cookie=> $c);
}

