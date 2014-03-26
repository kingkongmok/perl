#!/usr/bin/perl
#===============================================================================
#
#         FILE: transfterDropboxGPG.pl
#
#        USAGE: ./transfterDropboxGPG.pl FILENAME
#
#  DESCRIPTION: transfer files from dropbox with gpg encrypts.
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 03/26/2014 04:27:31 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use File::Basename ;
use KK::Gpgutil ;
use KK::Dropboxutil ;


sub gpgTriger {
    my ( $file ) = @_ ;
    if ( -r $file ) {
        my ($name,$path,$suffix) = fileparse($file, qr/\.[^.]*/);
        if ( $suffix eq '.asc' ) {
            decrypt($file) ;
        }
        else {
            encrypt($file) ;
        }
    }
} ## --- end sub gpgTriger


sub dropbox_changename {
    my ( $file ) = @_ ;
    my $outputfile =  dismissDropboxLocation($file);
#    if ( -e $outputfile ) {
#        print qq#going to overwriter $outputfile# ;
#    }
#    else {
#        print qq#$outputfile is not exits #;
#    }
} ## --- end sub dropbox_changename


if ( @ARGV ) {
    my ( $file ) = @ARGV ;
    if ( -e $file ) {
        dropbox_changename($file) ;
    }
    else {
        print qq#$file not found.\n#
    }
}
else {
    print qq#usage: $ENV{_} FILENAME\n# ;
}



#use Data::Dumper;
#print Dumper(\%ENV);

