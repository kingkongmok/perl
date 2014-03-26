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

our $gpgusername = "kk_blog" ;

sub decrypt {
    use File::Basename ;
    my	( $inputfile, $outputfile )	= @_;
    my ($name,$path,$suffix) = fileparse($inputfile, qr/\.[^.]*/);
    my $newfile = "$path" . "$name" ;
#    my $result = qx#/usr/bin/gpg -u kk_blog -d $file #; 
    print $newfile ;
    return ;
} ## --- end sub decrypt

sub encrypt {
    my	( $inputfile, $outputfile )	= @_;
    qx#/usr/bin/gpg -ea -r $gpgusername $inputfile#; 
    return ;
} ## --- end sub decrypt

1;
