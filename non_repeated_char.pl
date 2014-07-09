####################################################
# script name   : non_repeated_char.pl
# description   : print out the first non-repeated character in a string
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
    # if line is not empty
    if ($_ ne "")
    {
        my %chars;
        my @cs = split("",$_);
        # get unique characters in the string
        @chars{@cs} = ();
        # count number of appearances each char in the string
        for(my $i = 0; $i <= $#cs; $i++)
        {
            $chars{$cs[$i]} += 1;
        }

        my $non_repeated_char = "";
        my $j = 0;
        # loop util find out the first non-repeated char
        # or reach the end of the string
        while ($non_repeated_char eq "" && $j <= $#cs)
        {
            if ($chars{$cs[$j]} == 1)
            {
                $non_repeated_char = $cs[$j];
            }
            $j++;
        }
        # print out result
        print "$non_repeated_char\n";
    }
}

close(DATA);