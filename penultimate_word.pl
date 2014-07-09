####################################################
# script name   : penultimate_word.pl
# description   : Write a program which finds the next-to-last word in a string.
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
        @words = split(" ", $_);
        $number_of_word = @words;
        if ($number_of_word >= 2)
        {
            print $words[$number_of_word - 2]."\n";
        }
    }
}

close(DATA);