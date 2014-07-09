####################################################
# script name   : sum_of_integers.pl
# description   : print sum of largest sum of contiguous integers in a list
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 21/10/2013
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
    if($_ ne "")
    {
        my $largest_sum = -2147483648;
        # remove all whitespace
        $_ =~ s/\s//g;
        my @numbers = split(",",$_);
        # sum of total integers

        for (my $i = $#numbers; $i >= 0; $i--)
        {
            for (my $j = 0; $j <= $i; $j++)
            {
                # calculate sum of sub-array from jth to ith integers
                my $sum = 0;
                for (my $k = $j ; $k <= $i; $k++)
                {
                    $sum += $numbers[$k];
                }

                # re-calculate largest sum
                if ($sum > $largest_sum)
                {
                    $largest_sum = $sum;
                }
            }
        }
        print "$largest_sum\n";
    }
}

close DATA;