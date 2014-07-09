# creation date : Tue, 10/12/2013

#!/usr/bin/perl
use strict;
use warnings;

open (my $input, "<", $ARGV[0]) or die $!;
foreach(<$input>){
    chomp;
    # remove all characters which are not hidden or visible digits
    s/[^a-j0-9]//g;
    tr/a-j/0-9/;
    print "NONE\n" if $_ eq "";
    print "$_\n" if $_ ne "";
}
close($input);