####################################################
# script name   : trailing_string.pl
# description   : You are given two strings 'A' and 'B'. 
#               : Print out a 1 if string 'B' occurs at the end of string 'A'. Else a zero.
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
    # if line is not empty
    if ($_ ne "")
    {
        # split sentence and keyword
        my @line = split(",", $_);
        # split every characters of sentence and keyword
        my @sentence = split("",$line[0]);
        my @keyword = split("",$line[1]);

        my $result = 1;
        for(my $i = 0; $i <= $#keyword; $i++)
        {
            # compare one by one character from the end to the beginning of keyword
            # if there is any relative character of keyword differ from sentence
            # result is 0
            if ($keyword[$#keyword - $i] ne $sentence[$#sentence -$i])
            {
                $result = 0;
            }
        }
        # print out result
        print "$result\n";
    }
}

close(DATA);