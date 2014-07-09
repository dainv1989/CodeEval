####################################################
# script name   : word_to_digit.pl
# description   : Having a string representation of a set of numbers you need to print this numbers 
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 14/10/2013
####################################################
#!/usr/bin/perl
my %w2d = (
    "zero"  => 0,
    "one"   => 1,
    "two"   => 2,
    "three" => 3,
    "four"  => 4,
    "five"  => 5,
    "six"   => 6,
    "seven" => 7,
    "eight" => 8,
    "nine"  => 9
);
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
        # convert to lowercase
        $_ =~ s/\s//g;
        $_ = lc($_);
        
        # get all words of number
        my @numbers = split(";",$_);

        for(my $i = 0; $i <= $#numbers; $i++)
        {
            print $w2d{$numbers[$i]};
        }
        print "\n";
    }
}

close(DATA);