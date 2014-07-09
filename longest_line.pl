####################################################
# script name   : longest_line.pl
# description   : Write a program to read a multiple line text file and write the 'N' longest lines to stdout
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

# number of lines need to print
my $line_num = $content[0];

for (my $i = 1; $i < $#content; $i++)
{
    # sorting line content by length in descending order
    for (my $j = ($i + 1); $j <= $#content; $j++)
    {
        if (length($content[$j]) > length($content[$i]))
        {
            my $temp = $content[$j];
            $content[$j] = $content[$i];
            $content[$i] = $temp;
        }
    }
}

# print numbers of longest lines after sorting
for (my $i = 1; $i <= $line_num; $i++)
{
    print "$content[$i]\n";
}

close(DATA);