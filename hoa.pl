#!/usr/bin/perl 
#===============================================================================
#
#         FILE: hoa.pl
#
#        USAGE: ./hoa.pl  
#
#  DESCRIPTION: test hash of array, sepcial for the elements added at the last.
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 11/18/2013 10:53:19 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use Data::Dumper ;

my $string="
flintstones: fred barney wilma dino
jetsons:     george jane elroy
simpsons:    homer marge bart
simpsons:    kk kingkong
";

#print $string ;


#===  FUNCTION  ================================================================
#         NAME: gethoa
#      PURPOSE: 
#   PARAMETERS: $string
#      RETURNS: %hoa
#  DESCRIPTION: string split by /:/ and make prefix as key, suffix as [values].
#       THROWS: no exceptions
#     COMMENTS: none
#     SEE ALSO: n/a #=============================================================================== 
sub gethoa {
    my %hoa;
    my	( $par1 )	= @_;
    foreach my$line ( split/\n/,$par1 ) {
        next if $line =~ /^$/ ;
        my @lineelement = split /:\s+/,$line;
        if ( exists $hoa{$lineelement[0]} ) {
            foreach ( split/\s+/,$lineelement[1] ) {
                $hoa{$lineelement[0]}=[split/\s+/,($lineelement[1], join" ",$hoa{$lineelement[0]})] ;
            }
        }
        else {
            $hoa{$lineelement[0]}=[split/\s+/,$lineelement[1]] ;
        }
    }

#    use Data::Dumper;
#    print Dumper(\%hoa);

    return %hoa;
} ## --- end sub gethoa

print Dumper(&gethoa($string));
my%hoa=&gethoa($string);

print join"\t", &showhoaelements(\%hoa);

#===  FUNCTION  ================================================================
#         NAME: showhoaelements
#      PURPOSE: get  
#   PARAMETERS: %hoa
#      RETURNS: @array
#  DESCRIPTION: get %hoa values and push these into @array
#       THROWS: no exceptions
#     COMMENTS: none
#     SEE ALSO: n/a
#===============================================================================
sub showhoaelements {
    my	( $par1 )	= @_;
    my @array ;
    while ( my($k,$v)=each%$par1 ) {
#        local $\="\n";
        for ( my $idx=0; $idx<5; $idx++ ) {
             push @array, $v->[$idx] if $v->[$idx] ;
        }
    }
    return @array;
} ## --- end sub showhoaelements
