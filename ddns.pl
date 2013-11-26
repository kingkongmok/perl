#!/usr/bin/perl
#===============================================================================
#
#         FILE: ddns.pl
#
#        USAGE: ./ddns.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 11/26/2013 10:03:56 AM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use password ;

my%password=&getpassword;

#system('echo "http://$password{us}{username}:$password{kk}{password}@members.3322.org/dyndns/update?system=dyndns&hostname=$password{us}{username}.3322.org&mx=$password{us}{username}.3322.org"');
my $command = qq#curl "http://$password{us}{username}:$password{kk}{password}\@members.3322.org/dyndns/update?system=dyndns&hostname=$password{us}{username}.3322.org&mx=$password{us}{username}.3322.org > /dev/null "#;

system("$command");
