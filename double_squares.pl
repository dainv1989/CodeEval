####################################################
# script name   : double_squares.pl
# description   : facebook hacker cup 2011
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

# number of test cases
my $testcase = $content[0];
for (my $i = 1; $i <= $testcase; $i++)
{
    # if line is not empty
    if ($content[$i] ne "")
    {
        my $result = 0;
        my $j = 0;
        # upper limitation of $j
        my $upper = int(sqrt($content[$i] / 2));

        while($j <= $upper)
        {
            my $a = sqrt($content[$i] - $j**2);
            if($a == int($a))
            {
                $result++;
            }
            $j++;
        }
        print "$result\n";
    }
}

close(DATA);