####################################################
# script name   : number_of_ones.pl
# description   : determine the number of 1 bits in the internal representation of a given integer.
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 14/10/2013
####################################################
#!/usr/bin/perl
# function  : dec2bin
# usage     : convert decimal number to binary representation
sub dec2bin
{
    my $bin = sprintf("%b", shift);
    return $bin;
}

# open file in read-only mode
# read content of input file
# remove all end of line character (EOL)
open (DATA, "<", $ARGV[0]) or die $!;
@content = <DATA>;
chomp(@content);

foreach (@content)
{
    # if empty line, continue next one
    if ($_ ne "")
    {
        my $count = 0;
        @bits = split("",&dec2bin($_));
        # count number of ones bit
        foreach $bit(@bits)
        {
            if ($bit == 1)
            {
                $count++;
            }
        }
        # print result
        print "$count\n";
    }
}

# close file handle
close DATA;