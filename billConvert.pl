#!/usr/bin/perl
#===============================================================================
#
#         FILE: billConvert.pl
#
#        USAGE: ./billConvert.pl  
#
#  DESCRIPTION:  春丽姐 convert taobao's bill to a form
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 10/24/2013 04:39:56 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use Text::CSV;


 my @rows;
 my $csv = Text::CSV->new ( { binary => 1 } )  # should set binary attribute.
                 or die "Cannot use CSV: ".Text::CSV->error_diag ();
 
 open my $fh, "<:encoding(utf8)", "test.csv" or die "test.csv: $!";
 while ( my $row = $csv->getline( $fh ) ) {
     $row->[2] =~ m/pattern/ or next; # 3rd field should match
     push @rows, $row;
 }
 $csv->eof or $csv->error_diag();
 close $fh;

 $csv->eol ("\r\n");
 my $fh = "/home/kk/Downloads/bill.utf8.csv"; 
 open $fh, ">:encoding(utf8)", "new.csv" or die "new.csv: $!";
 $csv->print ($fh, $_) for @rows;
 close $fh or die "new.csv: $!";
 
 #
 # parse and combine style
 #
 
 $status = $csv->combine(@columns);    # combine columns into a string
 $line   = $csv->string();             # get the combined string
 
 $status  = $csv->parse($line);        # parse a CSV string into fields
 @columns = $csv->fields();            # get the parsed fields
 
 $status       = $csv->status ();      # get the most recent status
 $bad_argument = $csv->error_input (); # get the most recent bad argument
 $diag         = $csv->error_diag ();  # if an error occured, explains WHY
 
 $status = $csv->print ($io, $colref); # Write an array of fields
                                       # immediately to a file $io
 $colref = $csv->getline ($io);        # Read a line from file $io,
                                       # parse it and return an array
                                       # ref of fields
 $csv->column_names (@names);          # Set column names for getline_hr ()
 $ref = $csv->getline_hr ($io);        # getline (), but returns a hashref
 $eof = $csv->eof ();                  # Indicate if last parse or
                                       # getline () hit End Of File
 
 $csv->types(\@t_array);               # Set column types

#sub openfile {
#    open my $output , "> /home/kk/Downloads/billConvert_output.txt";
#    open FH,"< /home/kk/Downloads/bill.utf8.csv" || die "$!";
#    my @filelines = readline(FH);
#    return @filelines;
#} ## --- end sub openfile
#
#
#sub splitcsv {
#    my @filelines = @{shift()}; 
#    foreach my $line ( @filelines ) {
#            my $csv = Text::CSV->new ( { binary => 1 } ) || die "$!" ;
#            my $row = $csv->getline($line);
##            my $csv = Text::CSV->new();
##            my @columns = $csv->fields();
##            print $columns[0];
#    }
#    return ;
#} ## --- end sub splitcsv
#
#
#my @filelines = &openfile ;
#my @splitedfile = &splitcsv(\@filelines) ;
#


#my %hash ;
#
#    my $linecount;
#    while (<$fou>) {
#        if ($csv->parse($_)) {
#            my @columns = $csv->fields();
#            $linecount++;
#            if (  $columns[11] =~ /(\d+)\D+$/ ){
##                print $1, "\t", $columns[6] + $columns[7],"\n" ;
#                if ( exists $hash{$1} ) {
#                    $hash{$1} = sprintf("%s\t%.2f",$hash{$1} ,  $columns[6] + $columns[7]) ;     
#                } else {
#                    $hash{$1} = $columns[6] + $columns[7] ; 
#                }
#            } else {
#                if ( $columns[2] =~ /T200P(\d+)/ ) {
##                    print $1, "\t", $columns[6] + $columns[7],"\n" ;
#                if ( exists $hash{$1} ) {
#                    $hash{$1} = sprintf("%s\t%.2f",$hash{$1} ,  $columns[6] + $columns[7]) ;     
#                } else {
#                    $hash{$1} = $columns[6] + $columns[7] ; 
#                }
#                }
#            }
#        } else {
#            my $err = $csv->error_input;
#            print "Failed to parse line: $err";
#        }
#    }
#    close CSV;
#
#
#
