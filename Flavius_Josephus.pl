####################################################
# script name   : Flavius_Josephus.pl
# description   : 
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 11/11/2013
####################################################
#!/usr/bin/perl

# open file in read-only mode
# read content of input file
# remove all end of line character (EOL)
open (DATA, "<", $ARGV[0]) or die $!;
@content = <DATA>;
chomp(@content);

foreach $line(@content)
{
    if($line ne "")
    {
        my @nums = split(",",$line);
        my $top = $nums[0] - 1;
        my @arr = (0..$top);

        $i = 1;         # counter for executing
        $j = 0;         # counter in array

        # loop until array of number is empty
        while($#arr >= 0)
        {
            if($i == $nums[1])
            {
                # print out executed element
                print "$arr[$j] ";
                # remove executed element out of array
                splice(@arr, $j, 1);
                # reset executing counter
                $i = 1;
            }
            else
            {
                # increase counter variables
                $i++;
                $j++;
            }

            # reset counter variable in array
            # if it's over top index of array
            if($j > $#arr)
            {
                $j = 0;
            }
        }

        print "\n";
    }
}

close(DATA);