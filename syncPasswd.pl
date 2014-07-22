#!/usr/bin/perl
#===============================================================================
#
#         FILE: syncPasswd.pl
#
#        USAGE: ./syncPasswd.pl  
#
#  DESCRIPTION: sync passwd with gpg and dropbox.
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 07/22/2014 10:12:18 AM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use lib '/home/kk/workspace/perl';

sub writeTmpFile {
    use File::Temp qw/ tempfile tempdir /;
    use KK::Password ;
    my ($fh_data, $filename_data) = tempfile();

    my $pwsafeDate = '/home/kk/.pwsafe.dat';
    my $pwsafeDropbox_descryp='/home/kk/Dropbox/home/kk/.pwsafe.dat.asc' ;

    open FH_pwsEncrypted, $pwsafeDropbox_descryp ;
    open FH_tmp, ">", $filename_data ; 
    binmode FH_tmp ;
    my @string = readline(FH_pwsEncrypted) ;
    close FH_pwsEncrypted ;
    print FH_tmp &gpgDecrypt(\@string);
    my %pws_password = &getpassword;
    system("echo $pws_password{kk}{password} | /usr/bin/pwsafe -q --mergedb=$filename_data"); 
    unlink $filename_data ;
    open FH_pws , $pwsafeDate ;
    my @pwslines = readline(FH_pws);
    my $encrypdtxt  =  &gpgEncrypt(\@pwslines);

    open FH_pwsEncrypted, ">",  $pwsafeDropbox_descryp ;
    print FH_pwsEncrypted $encrypdtxt ;
    close FH_pwsEncrypted ;
    return ;
} ## --- end sub tmpFile

&writeTmpFile; 


sub gpgDecrypt {
    my ($encrypted) = @_ ;
    use Crypt::GPG;
    my $gpg = new Crypt::GPG;
    $gpg->gpgbin('/usr/bin/gpg');      # The GnuPG executable.
    $gpg->secretkey('kingkongmok@gmail.com');     # Set ID of default secret key.
    my ($plaintext) = $gpg->verify($encrypted);
    return $plaintext ;
} ## --- end sub gpgfile

sub gpgEncrypt {
    my ( $plaintext ) = @_ ;
    use Crypt::GPG;
    my $gpg = new Crypt::GPG;
    $gpg->gpgbin('/usr/bin/gpg');      # The GnuPG executable.
    $gpg->secretkey('kingkongmok@gmail.com');     # Set ID of default secret key.
    my $encrypted = $gpg->encrypt ($plaintext, 'kingkongmok@gmail.com');
    return $encrypted;
} ## --- end sub gpgfile

