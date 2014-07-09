####################################################
# script name   : counting_primes.pl
# description   : count number of primes between 2 given number (inclusive)
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 29/10/2013
####################################################
#!/usr/bin/perl

# function check a number is a prime number or not
sub is_prime
{
    my $num = $_[0];
    my $sqrt_num = int(sqrt($num));
    # if number greater than 2
    if($num > 2)
    {
        for(my $i = 2; $i <= $sqrt_num; $i++)
        {
            # if checking number deviable to any number
            # which greater than 2
            if($num % $i == 0)
            {
                # return false
                return 0;
            }
        }
    }
    # return true
    return 1;
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
        @numbers = split(",", $_);
        my $result = 0;
        for(my $i = $numbers[0]; $i <= $numbers[1]; $i++)
        {
            if(&is_prime($i) == 1)
            {
                $result += 1;
            }
        }
        print "$result\n";
    }
}

close(DATA);