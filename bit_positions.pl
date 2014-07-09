####################################################
# script name   : bit_position.pl
# description   : compare 2 bit value at 2 positions of a number
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 11/10/2013
####################################################
#
#!/usr/bin/perl
# function  : dec2bin
# usage     : convert a decimal number to binary (32 bits Big-endian)
sub dec2bin
{
    # convert decimal number to binary
    my $str = unpack("B32", pack("N", shift));
    return $str;
}

# open file in read-only mode
# read content of input file
# remove all end of line character (EOL)
open (DATA, "<", $ARGV[0]) or die $!;
@content = <DATA>;
chomp(@content);

foreach (@content)
{
    # get parameters
    @tmp = split(",",$_);

    # check validation of line
    # valid condition: not empty and contains 3 parameters
    # if invalid, continue handling next line
    if (($_ eq "") || ($#tmp != 2))
    {
        next;
    }

    # convert a number to binary
    # then split each bit, reverse right order and assign to an array
    @bits = reverse split('', &dec2bin($tmp[0]));

    if ($bits[$tmp[1] - 1] == $bits[$tmp[2] - 1])
    {
        print "true\n";
    }
    else
    {
        print "false\n";
    }
}

# close file handle
close DATA;