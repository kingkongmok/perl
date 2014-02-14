#!/usr/bin/perl -l
#===============================================================================
#
#         FILE: methodtesting.pl
#
#        USAGE: ./methodtesting.pl  
#
#  DESCRIPTION: to test the subroutines.
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 02/14/2014 02:35:33 PM
#     REVISION: ---
#===============================================================================

#use strict;
#use warnings;

#=usage
#    reduce \&f @x;
#eg.
#    reduce {$a+$b} @x;      # sum @x
#    reduce {$a*$b) 1..7     # factorial(7) = 7!
#=cut
#
#sub reduce (&@)
#{ my $f = shift;
#  local ($a, $b) = shift;
#  $a=&$f while $b=shift;
#  return $a;
#}
#
#my $x = reduce { $a*$b } 1..7;
#print $x;

#$a = 'a';@a = qw / a b c /;
#print $a."\t".@a;
#print $b."\t".@b;
#*b=*a;
#print $b."\t".@b;

 $lo='global';$m  = 'global'; 
A();

sub A { 
  local $lo='AAA';       my$m  = 'AAA'; 
  B(); 
}

sub B { 
    print "B ", ($lo eq 'AAA' ? 'can' : 'cannot') , 
    " see the value of lo set by A. the value is ", $lo;

    print "B ", ($m  eq 'AAA' ? 'can' : 'cannot') , 
    " see the value of m  set by A. the value is ", $m; 
}
