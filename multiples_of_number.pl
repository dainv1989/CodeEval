####################################################
# script name   : multiples_of_number.pl
# description   : Given numbers x and n, where n is a power of 2, 
#               : print out the smallest multiple of n which is greater than or equal to x
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
        @numbers = split(",", $_);

        if ($numbers[1] > 0)
        {
            $org = $numbers[1];
            while ($numbers[1] < $numbers[0])
            {
                $numbers[1] += $org;
            }
            print "$numbers[1]\n";
        }
    }
}

close(DATA);