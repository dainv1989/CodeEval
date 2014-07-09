####################################################
# script name   : demical_to_binary.pl
# description   : convert demical number to binary representation
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 14/10/2013
####################################################
#!/usr/bin/perl

# open file in read-only mode
# read content of input file
# remove all end of line character (EOL)
open (DATA, "<", $ARGV[0]) or die $!;
@content = <DATA>;
chomp(@content);

foreach (@content)
{
    if ($_ ne "")
    {
        $dec = sprintf("%b", $_);
        print "$dec\n";
    }
    else
    {
        next;
    }
}

# close file handle
close DATA;