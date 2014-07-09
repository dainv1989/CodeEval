####################################################
# script name   : prime_number.pl
# description   : print all prime numbers less than given number
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 11/10/2013
####################################################
#!/usr/bin/perl

# check a number is prime or not
# return 1 if true
# return 0 if false
sub is_prime
{
    my $number = $_[0];
    my $sqrtnum = sqrt($number);
    # if the checking number is an even number
    if ($number > 2 && $number%2 == 0)
    {
        return 0;
    }
    # if the checking number is an odd number
    elsif ($number%2 == 1)
    {
        my $i = 3;
        while ($i <= $sqrtnum)
        {
            if ($number % $i == 0)
            {
                return 0;
            }
            $i += 2;
        }

        if ($i >= $sqrtnum)
        {
            return 1;
        }
    }
    else
    {
        return 1;
    }
}

# open file in read-only mode
# read content of input file
# remove all end of line character (EOL)
open (DATA, "<", $ARGV[0]) or die $!;
@content = <DATA>;
chomp(@content);

my $max = 0;
# determine max number in file
foreach (@content)
{
    if ($_ > $max)
    {
        $max = $_;
    }
}


# calculate all prime number less than max value in file
# push result to an array
my @primes = ();
for (my $i = 2; $i <= $max; $i++)
{
    if ((&is_prime($i)) == 1)
    {
        push(@primes, ($i));
    }
}

# print result
foreach (@content)
{
    if ($_ > 1)
    {
        my $j = 0;
        while (($primes[$j] <= $_) && ($j <= $#primes))
        {
            if ($j > 0)
            {
                print ",";
            }
            print "$primes[$j]";
            $j++;
        }
        print "\n";
    }
}

# close file handle
close DATA;