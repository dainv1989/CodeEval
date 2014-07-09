####################################################
# script name   : cash_register.pl
# description   : 
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 05/11/2013
####################################################
#!/usr/bin/perl

my %cash = (
    0.01    => 'PENNY',
    0.05    => 'NICKEL',
    0.10    => 'DIME',
    0.25    => 'QUARTER',
    0.50    => 'HALF DOLLAR',
    1.00    => 'ONE',
    2.00    => 'TWO',
    5.00    => 'FIVE',
    10.00   => 'TEN',
    20.00   => 'TWENTY',
    50.00   => 'FIFTY',
    100.00  => 'ONE HUNDRED'
);
# sort value of keys %cash table in descending order
my @value = sort {$b <=> $a} (keys %cash);

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
        # remove all whitepsace characters
        $_ =~ s/\s//g;

        my @money = split(";", $_);
        # if there are two numbers in line
        if($#money == 1)
        {
            # calculate the change
            my $change = 0;
            $change = sprintf("%0.2f", ($money[1] - $money[0])) + 0;

            # if the change is less than zero
            if($change < 0)
            {
                print "ERROR\n";
            }
            # if the change is equal zero
            elsif($change == 0)
            {
                print "ZERO\n";
            }
            # if the change is more than zero
            else
            {
                my @result = ();
                my $i = 0;

                while($change > 0 && $i <= $#value)
                {
                    if($change >= $value[$i])
                    {
                        push(@result, $cash{$value[$i]});
                        $change = sprintf("%0.2f", ($change - $value[$i]));
                    }
                    else
                    {
                        $i++;
                    }
                }
                # print out result
                print join ",",@result;
                print "\n";
            }
        }
    }
}

close(DATA);