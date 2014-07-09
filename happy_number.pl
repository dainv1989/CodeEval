####################################################
# script name   : happy_number.pl
# description   : 
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 17/10/2013
####################################################
#!/usr/bin/perl

sub is_happy
{
    my %set;
    my $number = $_[0];

    while ($number > 1 && (!exists($set{$number})))
    {
        # add number to hash table
        $set{$number} = 0;

        # total square of all constituent numbers
        my @nums = split("",$number);
        $number = 0;
        foreach $item(@nums)
        {
            $number += $item**2;
        }
    }
    # return value
    if ($number == 1)
    {
        return 1;
    }
    else
    {
        return 0;
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
    # if line is not empty
    if ($_ ne "")
    {
        print &is_happy($_);
        print "\n";
    }
}

close(DATA);