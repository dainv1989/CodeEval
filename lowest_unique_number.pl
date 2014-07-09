####################################################
# script name   : lowest_unique_number.pl
# description   : 
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
        # separate numbers and sort ascending order
        @arr = split(" ", $_);
        @numbers = sort {$a <=> $b} @arr;

        # if there is only one number in a line
        if ($#numbers == 0)
        {
            print "1\n";
        }
        # more than 1 number
        else
        {
            my $count = 1;          # number of repeats a value
            my $unique = 0;         # result
            my $i = 1;              # count value

            # while loop util reach the end of array
            # or find out the lowest unique number
            while ($i <= $#numbers && $unique == 0)
            {
                # if current number value is equal previous number value
                if ($numbers[$i] == $numbers[$i - 1])
                {
                    $count++;
                }
                else
                {
                    # if number of repeat the previous value is only 1
                    if ($count == 1)
                    {
                        # bing go!
                        $unique = $numbers[$i - 1];
                    }
                    else
                    {
                        # reset count variable
                        $count = 1;
                    }
                }
                $i++;
            }

            # if there is no unique number
            if ($unique == 0)
            {
                print "$unique\n";
            }
            else
            {
                # loop through original array
                for (my $j = 0; $j <= $#arr; $j++)
                {
                    if ($arr[$j] == $unique)
                    {
                        # print out position (based 1) of lowest unique number
                        $j = $j + 1;
                        print "$j\n";
                    }
                }
            }
        }
    }
}

close(DATA);