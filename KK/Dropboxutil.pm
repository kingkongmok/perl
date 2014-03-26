use strict;
use warnings;
 
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION     = 1.00;
@ISA         = qw(Exporter);
@EXPORT      = ();
#@EXPORT_OK   = qw(func1 func2);
#%EXPORT_TAGS = ( DEFAULT => [qw(&func1)],
#                 Both    => [qw(&func1 &func2)]);


sub dismissDropboxLocation {
use File::Basename ;
my	( $fullname )	= @_;
my ($name,$path, $suffix) = fileparse($fullname, qr/\.[^.]*/);
if ( $path =~ /^\.\// ) {
    return $ENV{'PWD'} . $name . $suffix =~ s#/home/kk/Dropbox/#/home/kk/#r;
}
else {
    my $newpath =  $path =~ s#/home/kk/Dropbox/#/home/kk/#r;
    return $newpath . $name. $suffix ;
}
    
}


1;
