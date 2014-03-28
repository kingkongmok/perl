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
use File::Spec;
use lib '/home/kk/workspace/perl';
use KK::Gpgutil ;
use KK::Dropboxutil ;

my %gpgVaris = (
    gpgUser=>'kingkongmok@gmail.com'
);

&transfer ;
sub transfer {
    if ( @ARGV ) {
        my ( $file ) = @ARGV ;
        if ( -f $file ) {
            if ( -r $file ) {

                # rel2abs Converts a relative path to an absolute path .
                my $filename = File::Spec->rel2abs($file);
                my ($name,$path,$suffix) = fileparse($filename, qr/\.[^.]*/);

                # if file.asc, decrypt it, if not file.asc, encrypt it.
                if ( $suffix eq '.asc' ) {
                    my $outputfile = dismissDropboxLocation($filename);
                    decrypt($filename, $outputfile, \%gpgVaris);
                }
                else {
                my $outputfile = addDropboxLocation($filename) ;
                    encrypt($filename, $outputfile, \%gpgVaris) ;
                }
            }
        }
        else {
            print qq#$file not found.\n#
        }
    }
    else {
        print qq#usage: $ENV{_} FILENAME\n# ;
    }
} ## --- end sub transfer
