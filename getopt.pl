#!/usr/bin/perl
#===============================================================================
#
#         FILE: getopt.pl
#
#        USAGE: ./getopt.pl  
#
#  DESCRIPTION: test Getopt::Long funtion. 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 12/04/2013 12:18:52 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use Getopt::Long;
my %opts = (parameter => 20);
GetOptions( \%opts, 
        'p|parameter=i', 
        'o|outputfile=s',
        'i|inputfile=s'
) or die "Invalid parameters!";


use Data::Dumper;
print Dumper(%opts);

