####################################################
# script name   : even number
# description   : determine a number read from a file is even or odd number
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
    # if number is an even number
    if (($_ % 2) == 0)
    {
        print "1\n";
    }
    # if number is an odd number
    else
    {
        print "0\n";
    }
}

#close file handle
close DATA;