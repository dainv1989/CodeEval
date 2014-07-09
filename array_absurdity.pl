####################################################
# script name   : array_absurdity.pl
# description   : 
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 29/10/2013
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
    # if string is not empty
    if ($_ ne "")
    {
        # split string by semicolon character
        my @tmp = split(";", $_);
        my $number_of_element = $tmp[0] + 0;
        # get array of numbers
        my @array = split(",", $tmp[1]);
        my %numbers;

        for(my $i = 0; $i < $number_of_element; $i++)
        {
            # if current number is not exists as a key in a hash table
            if(not exists($numbers{$array[$i]}))
            {
                # add number as a new key to a hash table
                $numbers{$array[$i]} = 0;
            }
            # if exists
            else
            {
                # print out result and exit for loop
                print "$array[$i]\n";
                last;
            }
        }
    }
}

close DATA;