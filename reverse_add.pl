####################################################
# script name   : reverse_add.pl
# description   : 
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 30/10/2013
####################################################
#!/usr/bin/perl

sub is_palindrome
{
    my $number = $_[0] + 0;
    # split constituent digits
    my @digits = split("", $_[0]);
    # reverse order ofdigits
    @digits = reverse(@digits);
    my $rev = join "",@digits;
    # convert string to number
    $rev = $rev + 0;

    # check palindrome and return
    if($rev == $number)
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
        # remove all white
        $_ =~ s/\s//g;
        my $num = $_;
        my $result = 0;
        while(&is_palindrome($num) == 0 && $result <= 100)
        {
            my @digit = split("", $num);
            @digit = reverse(@digit);
            my $tmp = join "",@digit;
            # convert string to number
            $tmp = $tmp + 0;
            $num += $tmp;
            $result++;
        }
        print "$result $num\n";
    }
}

close(DATA);