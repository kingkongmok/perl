use strict;
use warnings;
use File::Spec;
 

sub addDropboxLocation($) {
    my	( $fullname )	= @_;
#    if ( $fullname !~ m#^/home/kk/# ) {
#        return $fullname =~ s#^#/home/kk/Dropbox#r =~ s#$#\.asc#r;
#    }
#    return $fullname =~ s#/home/kk/#/home/kk/Dropbox/#r =~ s#$#\.asc#r;
    return $fullname =~ s#^#/home/kk/Dropbox#r =~ s#$#\.asc#r;
}

sub dismissDropboxLocation($) {
    my	( $fullname )	= @_;
#    if ( $fullname !~ m#^/home/kk/# ) {
#        return $fullname =~ s#^#/home/kk/Dropbox#r;
#    }
#    return $fullname =~ s#/home/kk/Dropbox/#/home/kk/#r =~ s#\.asc$##r;
    return $fullname =~ s#^/home/kk/Dropbox##r =~ s#\.asc$##r;
}


1;
