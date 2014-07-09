####################################################
# script name   : hex_to_demical.pl
# description   : convert hex to demical value
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 11/10/2013
####################################################
#
#!/usr/bin/perl

# open file in read-only mode
# read content of input file
# remove all end of line character (EOL)
open (DATA, "<", $ARGV[0]) or die $!;
@content = <DATA>;
chomp(@content);

foreach (@content)
{
    $dec = hex $_;
    print "$dec\n";
}

# close file handle
close DATA;