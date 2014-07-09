####################################################
# script name   : minimum_coins.pl
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

foreach (@content)
{
    # if line is not empty
    if ($_ ne "")
    {
        $min = int($_ / 5) + int(($_ % 5) / 3) + int(($_ % 5) % 3);
        print "$min\n";
    }
}

close(DATA);