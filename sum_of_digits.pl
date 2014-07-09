####################################################
# script name   : sum of digits
# description   : Given a positive integer, find the sum of its constituent digits.
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 11/10/2013
####################################################
#
#!/usr/bin/perl
# if number of argument is not equal 1
# argument is input file
if (($#ARGV != 0))
{
    exit;
}
else
{
    if ((not -e $ARGV[0]) or        # file existence
        (not -T $ARGV[0]))          # text file check
    {
        exit;
    }
}

# open file in read-only mode
# read content of input file
# remove all end of line character (EOL)
open (DATA, "<", $ARGV[0]) or die $!;
@content = <DATA>;
chomp(@content);

foreach (@content)
{
    # get number from each line
    $number = $_;
    # calculate sum of constituent digits
    if ($number > 0)
    {
        $sum = 0;
        while ($number > 0)
        {
            $sum += $number % 10;
            $number /= 10;
        }
        print "$sum\n";
    }
}

close DATA;