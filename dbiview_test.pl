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

my $simpleQueryName = "testname";


my $dbh = connectDBI($dsn, $user, $password);

#&simpleQuery($dbh, $simpleQueryName );
#my %result = &simpleQueryhash($dbh, $simpleQueryName );

my @insertStrings = ( "name1", "f", "2010-1-10" );
&simpleInsert($dbh, @insertStrings) ;

$dbh->disconnect() ;

sub simpleInsert {
    my $dbh = shift ;
    my	( $name, $sex, $birth )	= @_;
    my $sql = "INSERT INTO user(name, sex, birth) values(?,?,?)";
    my $sth = $dbh->prepare($sql) ;
    $sth->execute($name, $sex, $birth) ;

#    $dbh->do('INSERT INTO user VALUES('$name', '$sex', '$birth' )') || die $!;

    return ;
} ## --- end sub simpleInsert

sub simpleQueryhash {
    my	( $dbh, $simpleQueryName )	= @_;
    my $sth = $dbh->prepare("SELECT * FROM user WHERE name='$simpleQueryName' ") || die "prepare error";
    $sth->execute ;
    my $result =  $sth->fetchrow_hashref;
    return %$result ;
} ## --- end sub simpleQueryhash

sub simpleQuery {
    my	( $dbh, $simpleQueryName )	= @_;
    my $sth = $dbh->prepare("SELECT * FROM user WHERE name='$simpleQueryName' ") || die "prepare error";
    $sth->execute ;
    my @results =  $sth->fetchrow_array;
    use Data::Dumper;
    print Dumper(\@results);
} ## --- end sub simpleQuery

sub connectDBI {
    my	( $dsn, $sqluser, $sqlpassword )	= @_;
    my $dbh = DBI->connect($dsn, $user, $password, {RaiseError => 1}) || die "connect error";
    return $dbh;
} ## --- end sub connectDBI

