####################################################
# script name   : fibonacci
# description   : compute Nth fibonacci number
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 11/10/2013
####################################################
#!/usr/bin/perl

# function      : fibonacci
# description   : compute Nth fibonacci number
sub fibonacci
{
    if ($_[0] == 0)
    {
        return 0;
    }
    elsif ($_[0] == 1) 
    {
        return 1;
    }
    else
    {
        return ((&fibonacci($_[0] - 1)) + &fibonacci(($_[0] - 2)));
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
    # calculate sum of constituent digits
    if ($_ >= 0)
    {
        $ret = &fibonacci($_);
        print "$ret\n";
    }
}
close DATA;