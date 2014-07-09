####################################################
# script name   : fizz_buzz.pl
# description   : 
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 17/10/2013
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
        my @result = ();
        my @numbers = split(" ", $_);

        for (my $i = 1; $i <= $numbers[2]; $i++)
        {
            my $tmp = "";
            if ($i % $numbers[0] == 0)
            {
                if ($i % $numbers[1] == 0)
                {
                    $tmp = "FB";
                }
                else
                {
                    $tmp = "F";
                }
            }
            elsif ($i % $numbers[1] == 0)
            {
                $tmp = "B";
            }
            else
            {
                $tmp = "$i";
            }
            push (@result, $tmp);
        }
        print join " ",@result;
        print "\n";
    }
}

close(DATA);