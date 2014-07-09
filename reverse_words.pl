####################################################
# script name   : reverse_words.pl
# description   : print reverse words of sentences get from a file
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
    my @list = split(" ", $_);

    print @list[$#list];
    for ($i = $#list - 1; $i >= 0; $i--)
    {
        print " $list[$i]";
    }
    print "\n";
}

# close file handle
close DATA;