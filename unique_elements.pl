####################################################
# script name   : unique elements
# description   : print unique elements from sorted integer arrays read from a file
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
    # get list numbers from each line of file
    my @list = split(",", $_);

    print @list[0];
    for ($i = 1; $i <= $#list; $i++)
    {
        if ($list[$i] != $list[$i - 1])
        {
            print ",$list[$i]";
        }
    }
    print "\n";
}

# close file handle
close DATA;