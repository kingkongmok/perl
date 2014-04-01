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
usage: pSearch.pl pattern..
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
    my $mlocatedbDropboxLocation = '/home/kk/Dropbox/home/kk/Documents/personal/mlocate.db.asc' ;
    my $mlocatedbLocalLocation = '/home/kk/Documents/personal/mlocate.db';
    my %gpgVaris = (
        gpgUser=>'kingkongmok@gmail.com'
    );
    decrypt($mlocatedbDropboxLocation, $mlocatedbLocalLocation, \%gpgVaris);
    my %mlocateResult = &getMlocateResults(\@_, $mlocatedbLocalLocation);
    return %mlocateResult;
} 

sub md5FileSearch {
    my	( $keyword )	= @_;
    my $md5File= '/home/kk/Dropbox/Downloads/mldonkey/torrent_done_before.md5';
    return ;
} ## --- end sub md5FileSearch


if ( @ARGV ) {
    my %md5FileResult = &md5FileSearch(\@ARGV) ;
    my %mlocateResult = &mlocateSearch(\@ARGV) ;
use Data::Dumper;


print Dumper(\%md5FileResult);
print Dumper(\%mlocateResult);

}
else {
    &usage ;
}

