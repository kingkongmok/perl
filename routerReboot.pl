#!/usr/bin/perl 
#===============================================================================
#
#         FILE: routerReboot.pl
#
#        USAGE: ./routerReboot.pl  
#
#  DESCRIPTION: reload pppoe to get new ip from ISP, then reply change to ddns.
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 10/24/2013 12:48:36 AM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use lib "/home/kk/workspace/perl" ;
use password ;
my%password=&getpassword;


if ( system('curl -q "http://$password{kk}{username}:$password{kk}{password}\@192.168.1.1/userRpm/StatusRpm.htm?Disconnect=%B6%CF%20%CF%DF&wan=1" >/dev/null 2>&1') ) {
}

if (system('curl -q "http://$password{kk}{username}:$password{kk}{password}\@192.168.1.1/userRpm/StatusRpm.htm?Connect=%C1%AC%20%BD%D3&wan=1" >/dev/null 2>&1') ) {
}

my $ping ;
do {
    $ping = system("ping -q -c1 google.com > /dev/null");
    sleep 3 ;
} while ( $ping );				# -----  end do-while  -----
#

my $update;
do {
    $update=system('curl -q "http://$password{us}{username}:$password{kk}{password}\@members.3322.org/dyndns/update?system=dyndns&hostname=$password{us}{username}.3322.org&mx=$password{us}{username}.3322.org" > /dev/null 2>&1');
    sleep 1 ;
} while ( $update );				# -----  end do-while  -----
