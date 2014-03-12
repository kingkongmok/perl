#!/usr/bin/perl
#===============================================================================
#
#         FILE: testget.pl
#
#        USAGE: ./testget.pl  
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
#      CREATED: 10/18/2013 02:33:53 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use CGI ;
use DBI;
use CGI::Carp qw/fatalsToBrowser/;
use utf8 ;

my $request = new CGI ;
my $name = $request->param("name");
print $request->header(-charset=>"utf-8"),
$request->start_html("thanks for using inncheck");
if ( $name ) {
    my $dsn = "dbi:mysql:test" ;
    my $user = "kk" ;
    my $password = "kk" ;
    my $dbh = DBI->connect($dsn, $user, $password,  {AutoCommit=>0, RaiseError=>1}) || die "connect error";
    my ($row, @rowarray ) = query($dbh, "$name");
    print $request->p("there are $row rows .") ;

}
else {
    print $request->p("please insert the name");
}
print $request->end_html;


sub query {
    my %result ; 
    my ($dbh, $name ) = @_ ;
    my $sth = $dbh->prepare("SELECT Name, CtfId, Address, Mobile FROM inn WHERE Name like ?");
    #Emy $sth = $dbh->prepare("SELECT Name WHERE Name like ?");
    $sth->execute( "%$name%" ) or die $DBI::errstr;
    my $row = $sth->rows;
    my @rowarray ;
    my $iterator = 0 ;
    while ( my @rows = $sth->fetchrow_array()) {
        $rowarray[$iterator] = join";",@rows ;
        $iterator++ ;
    }
    $sth->finish(); 
    return ( $row, @rowarray );
} ## --- end sub query

