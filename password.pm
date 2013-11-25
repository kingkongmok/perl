#
#===============================================================================
#
#         FILE: private.pm
#
#  DESCRIPTION: file to restore username and password.
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Kingkong Mok (), kingkongmok AT gmail DOT com
#      COMPANY: 
#      VERSION: 1.0
#      CREATED: 11/25/2013 05:20:42 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
 

#===  FUNCTION  ================================================================
#         NAME: passwd
#      PURPOSE: get username, passwod and so on
#   PARAMETERS: 
#      RETURNS: %passwd
#  DESCRIPTION: ????
#       THROWS: no exceptions
#     COMMENTS: none
#     SEE ALSO: n/a
#===============================================================================
sub passwd {
    open FH, "< /home/kk/.kk_var" || die $! ;
    while ( <FH> ) {
        print ;
    }
    return ;
} ## --- end sub passwd

&passwd ;
