###############################################################
# script name	: shortest_repetition.pl
# description	: determine the shortest repetition in a string
# author		: Dai Nguyen-Van
# email			: dainv1989@gmail.com
# creation date	: 17/10/2013
###############################################################
#!/usr/bin/perl

# open input file
# read content
# remove EOL character
open (DATA, "<", $ARGV[0]) or die $!;
@content = <DATA>;
chomp(@content);

foreach (@content)
{
    # if line is not empty
    if ($_ ne "")
    {
        my $period = 0;
        # remove all whitespace character
        $_ =~ s/\s//g;
        # get length of string
        my $len = length($_);

        my $i = 1;
        # loop util get shortest repetition or end of the string
        while ($i <= $len && $period == 0)
        {
            if ($len % $i == 0)
            {
                my @str;
                my $repeat_str;
                # combination string with period i
                for (my $j = 0; $j < ($len / $i); $j++)
                {
                    $str[$j] = substr($_, 0, $i);
                }
                $repeat_str = join("",@str);

                # if conbination string equal to the original string
                if($repeat_str eq $_)
                {
                    $period = $i;
                }
            }
            $i++;
        }
        print "$period\n";
    }
}