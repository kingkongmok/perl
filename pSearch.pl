#!/usr/bin/perl
#===============================================================================
#
#         FILE: pSearch.pl
#
#        USAGE: ./pSearch.pl  
#
#  DESCRIPTION: search p from mlocatedb and md5file
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 03/29/2014 10:17:01 AM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use lib '/home/kk/workspace/perl';
use KK::Gpgutil;
use KK::Mlocate;

sub usage {
print <<END
usage: pSearch.pl FILENAME
END
;
} ## --- end sub usage

sub locateSearch {
    my	( $keyword )	= @_;
    return ;
} ## --- end sub locateSearch

sub getLocateFile {
    my	( $par1 )	= @_;
    return ;
} ## --- end sub getLocateFile

sub getMd5File {
    my	( $par1 )	= @_;
    return ;
} ## --- end sub getMd5File

sub mlocateSearch {
    my $mlocatedbDropboxLocation = '/home/kk/Dropbox/Documents/personal/mlocate.db.gpg';
    my $mlocatedbLocalLocation = '/home/kk/Documents/personal/mlocate.db';
    my %gpgVaris = (
        gpgUser=>'kingkongmok@gmail.com'
    );
    decrypt($mlocatedbDropboxLocation, $mlocatedbLocalLocation, \%gpgVaris);
    my %mlocateResult = &getMlocateResults(\@_, $mlocatedbLocalLocation);
    return %mlocateResult;
} ## --- end sub md5FileSearch

sub md5FileSearch {
    my	( $keyword )	= @_;
    my $mlocatedbDropboxLocation = '/home/kk/Dropbox/Documents/personal/mlocate.db.gpg';
    my $mlocatedbLocalLocation = '/home/kk/Documents/personal/mlocate.db';
    my %gpgVaris = (
        gpgUser=>'kingkongmok@gmail.com'
    );
    decrypt($mlocatedbDropboxLocation, $mlocatedbLocalLocation, \%gpgVaris);
    return ;
} ## --- end sub md5FileSearch

&md5FileSearch ;

if ( @ARGV ) {
    my %mlocateResult = &mlocateSearch(\@ARGV) ;
use Data::Dumper;
print Dumper(\%mlocateResult);

}
else {
    &usage ;
}

