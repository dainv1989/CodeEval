####################################################
# script name   : reverse_group.pl
# description   : 
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 30/10/2013
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
        # remove all white
        $_ =~ s/\s//g;
        # split array of numbers and multiple value
        my @tmp = split(";", $_);
        # get array of numbers
        my @numbers = split(",", $tmp[0]);
        # get multiple value
        my $mul = $tmp[1];

        $i = 0;
        while(($i + $mul - 1) <= $#numbers)
        {
            my @arr = @numbers[$i..($i + $mul - 1)];
            @numbers[$i..($i + $mul - 1)] = reverse(@arr);
            $i += $mul;
        }
        # print result
        print join ",",@numbers;
        print "\n";
    }
}

close(DATA);