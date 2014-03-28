use strict;
use warnings;
use File::Spec;
 

#-------------------------------------------------------------------------------
#  /path/file to /home/kk/Dropbox/path/file.asc
#-------------------------------------------------------------------------------
sub addDropboxLocation($) {
    my	( $fullname )	= @_;
    return $fullname =~ s#^#/home/kk/Dropbox#r =~ s#$#\.asc#r;
}

#-------------------------------------------------------------------------------
#  /home/kk/Dropbox/path/file.asc to /path/file
#-------------------------------------------------------------------------------
sub dismissDropboxLocation($) {
    my	( $fullname )	= @_;
    return $fullname =~ s#^/home/kk/Dropbox##r =~ s#\.asc$##r;
}


1;
