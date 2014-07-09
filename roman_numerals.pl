####################################################
# script name   : roman_numerals.pl
# description   : Write a program to convert a cardinal number to a Roman numeral.
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 14/10/2013
####################################################
#!/usr/bin/perl
my %roman = (
    1   => "I",
    2   => "II",
    3   => "III",
    4   => "IV",
    5   => "V",
    6   => "VI",
    7   => "VII",
    8   => "VIII",
    9   => "IX",
    10  => "X",
    20  => "XX",
    30  => "XXX",
    40  => "XL",
    50  => "L",
    60  => "LX",
    70  => "LXX",
    80  => "LXXX",
    90  => "XC",
    100 => "C",
    200 => "CC",
    300 => "CCC",
    400 => "CD",
    500 => "D",
    600 => "DC",
    700 => "DCC",
    800 => "DCCC",
    900 => "CM",
    1000 => "M",
    2000 => "MM",
    3000 => "MMM"
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
        my @result = ();
        my $number = $_;
        $number =~ s/\s//g;

        for (my $i = length($number) - 1; $i >= 0; $i--)
        {
            my $mod = $number % (10 ** $i);
            if (exists($roman{$number - $mod}))
            {
                push(@result, $roman{$number - $mod});
            }
            $number = $mod;
        }

        print join "",@result;
        print "\n";
    }
}

close(DATA);