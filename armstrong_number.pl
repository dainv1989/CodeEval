####################################################
# script name   : armstrong_number.pl
# description   : determine a number is an armstrong number or not
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 14/10/2013
####################################################
#
#!/usr/bin/perl

# open file in read-only mode
# read content of input file
# remove all end of line character (EOL)
open (DATA, "<", $ARGV[0]) or die $!;
@content = <DATA>;
chomp(@content);

foreach (@content)
{
    # split constituent digits of numbers
    @numbers = split '',$_;

    # calculate sum of nth power of constituent digits
    # nth = $#numbers + 1
    my $sum = 0;
    foreach $num(@numbers)
    {
        $sum += $num ** ($#numbers + 1);
    }

    # if number is Armstrong number
    if ($sum == $_)
    {
        print "True\n";
    }
    # if not
    else
    {
        print "False\n";
    }
}

# close file handle
close DATA;