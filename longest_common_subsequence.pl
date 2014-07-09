#############################################################################
# file name     : longest_common_subsequence.pl
# description   : find out the longest common subsequence of two strings
# author        : Dai Nguyen-Van
# email         : dainv1989 at gmail dot com
# creation date : 29/11/2013
#############################################################################
#!/usr/bin/perl
use strict;
use warnings;

open(my $input, "<", $ARGV[0]) or die $!;
foreach (<$input>)
{
    chomp;
    my @strings = split(";", $_);
    my @words = split("", $strings[0]);
    my $patern = "";
    foreach my $word(@words)
    {
        $patern = $patern."(".$word.")"."?";
    }
    print "$_" if ($strings[1] =~ /$patern/);
}
close($input);