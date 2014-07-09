####################################################
# script name   : number_pairs.pl
# description   : Print out all pairs of numbers whose sum is equal to X.
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 25/10/2013
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
        # remove all whitespace
        $_ =~ s/\s//g;
        my @tmp = split(";", $_);
        # array of numbers
        my @numbers = split(",", $tmp[0]);
        # the sum value which will be compared
        my $x = $tmp[1];
        my @pairs = ();
        my $i = 0;
        while ($i < $#numbers)
        {
            # if 2 neighbour numbers are equal
            if($numbers[$i] == $numbers[$i + 1])
            {
                $i++;
            }
            else
            {
                my $j = $i + 1;
                # sub loop util reach the end of array
                # or find out a pair
                while ($j <= $#numbers)
                {
                    my $sum = $numbers[$i] + $numbers[$j];
                    if($sum == $x)
                    {
                        # add pairs to result string array
                        push(@pairs, "$numbers[$i],$numbers[$j]");
                        # break sub while loop
                        last;
                    }
                    $j++;
                }
                $i++;
            }
        }
        if(@pairs != 0)
        {
            print join ";", @pairs;
            print "\n";
        }
        else
        {
            print "NULL\n";
        }
    }
}

close(DATA);