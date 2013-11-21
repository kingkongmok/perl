#!/usr/bin/env perl

use strict ;
use warnings;
use CGI;

my $q = new CGI ;

if ( $q->param ){
   my @names = $q->param ; 
   print $q->header;
   print "$_\n" for @names;
   
}
else {
print $q->header,
    "hello"
}

