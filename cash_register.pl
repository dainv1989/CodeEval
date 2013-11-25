###############################################################
# script name	: cash_register.pl
# description	: 
# author		: Dai Nguyen-Van
# email			: dainv1989@gmail.com
# creation date	: 02/11/2013
###############################################################
#!/usr/bin/perl

my %cash = (
    0.01 => 'PENNY',
    0.05 => 'NICKEL',
    0.10 => 'DIME',
    0.25 => 'QUARTER',
    0.50 => 'HALF DOLLAR',
    1.00 => 'ONE',
    2.00 => 'TWO',
    5.00 => 'FIVE',
    10.00 => 'TEN',
    20.00 => 'TWENTY',
    50.00 => 'FIFTY',
    100.00 => 'ONE HUNDRED');

my @value = sort {$b <=> $a} (keys %cash);

# open input file
# read content
# remove EOL character
open (DATA, "<", $ARGV[0]) or die $!;
@content = <DATA>;
chomp(@content);

foreach (@content)
{
    # check empty line
    if ($_ ne "")
    {
        # remove all whitespace if any
        $_ =~ s/\s//g;
        my @money = split(";", $_);
        my $charge = $money[1] - $money[0];
        if($charge < 0)
        {
            print "ERROR\n";
        }
        elsif($charge == 0)
        {
            print "ZERO\n";
        }
        else
        {
            my @result = ();
            my $i = 0;
            while($charge >= 0 && $i <= $#value)
            {
                if($charge >= $value[$i])
                {
                    push(@result, $cash{$value[$i]});
                    $charge -= $value[$i];
                }
                else
                {
                    $i++;
                }
            }
            print join ",", @result;
            print "\n";
        }
    }
}

close(DATA);