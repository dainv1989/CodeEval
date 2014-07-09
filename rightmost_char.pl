####################################################
# script name   : rightmost_char.pl
# description   : find out rightmost char position in a string
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
    # if line is empty, continue hanling next line
    if ($_ eq "")
    {
        next;
    }

    # get parameters from each line
    @tmp = split ",",$_;
    # if it's not enought 2 parameters
    if ($#tmp != 1)
    {
        # continue handling next line
        next;
    }

    # tmp[1] is the char need to find out position
    # tmp[0] is the string which in to find a char
    print rindex($tmp[0], $tmp[1])."\n";
}

# close file handle
close DATA;