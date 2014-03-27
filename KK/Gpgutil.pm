use strict;
use warnings;
#use File::Copy;
use File::Copy::Recursive qw/rmove/;
our $gpgusername = "kk_blog" ;

sub decrypt($$) {
    my	( $inputfile, $outputfile )	= @_;
    print $outputfile ;
    open ( my $filehandle, ">", $outputfile ) or die "$!";
    print $filehandle qx#/usr/bin/gpg -u kk_blog -d $inputfile#; 
    close $filehandle;
    print "$outputfile saved\n";

} ## --- end sub decrypt

sub encrypt($$) {
    my	( $inputfile , $outputfile )	= @_;
    my $ascFilename = $inputfile . ".asc" ;
    qx#/usr/bin/gpg -ea -r $gpgusername $inputfile#; 
    rmove($ascFilename,$outputfile) || die $!;
    print "$outputfile saved\n";

    
} ## --- end sub decrypt

1;
