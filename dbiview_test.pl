#!/usr/bin/perl
#===============================================================================
#
#         FILE: dbitest.pl
#
#        USAGE: ./dbitest.pl  
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
#      CREATED: 02/17/2014 02:41:37 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use DBI;
my $dsn = "dbi:mysql:test" ;
my $user = "kk" ;
my $password = "kk" ;
my $dbh = DBI->connect($dsn, $user, $password) || die "connect error";

my $sth = $dbh->prepare("SELECT * from user") || die "prepare error";
$sth->execute ;

while ( my @row = $sth->fetchrow_array ) {
print "@row\n";
}
