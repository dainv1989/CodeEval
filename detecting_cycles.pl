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
    my @cycles = ();
    my @numbers = split(" ",$_);
    # there is more than 1 numbers per line
    if($#numbers >= 1)
    {
        my $i = 0;
        # loop util reach next before the last number
        while($i < $#numbers)
        {
            my $period = 0;
            my $j = $i + 1;
            # loop util reach the last number
            while($j <= $#numbers)
            {
                if ($numbers[$j] == $numbers[$i])
                {
                    push(@cycles, $numbers[$i]);
                    $period = $j - $i;
                    $i++;
                    $j++;
                }
                else
                {
                    $j++;
                }
            }
            $i++;
        }
        # print out result
        print join " ",@cycles;
        print "\n";
    }
}