####################################################
# script name   : decode_numbers.pl
# description   : 
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 11/11/2013
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
        # convert string to number, remove leading zero
        $_ = $_ * 1;
        # variables for recursive calculating result
        $n1 = 1;
        $n2 = 0;
        # store result
        $result = 0;

        # split one by one digit of the string
        my @digits = split("", "0$_");
        for($i = 1; $i <= $#digits; $i++)
        {
            # combine with previous digit
            $tmp = "$digits[$i - 1]$digits[$i]";
            # convert from string to number
            $num = $tmp * 1;

            # if combination equals to zero
            if($num == 0)
            {
                $result = 0;
                # break loop
                last;
            }
            elsif($num > 0 && $num <= 26)
            {
                if($digits[$i] == 0)
                {
                    $result = $n2;
                    $n1 = $n2;
                }
                else
                {
                    # recursive calculating result
                    $result = $n1 + $n2;
                    # reassign values
                    $n2 = $n1;
                    $n1 = $result;
                }
            }
            elsif($num > 26)
            {
                if($digits[$i] == 0)
                {
                    $result = 0;
                    # break loop
                    last;
                }
                else
                {
                    # recursive calculating result
                    $result = $n1;
                    $n2 = $n1;
                }
            }
        }
        print "$result\n";
    }
}

close(DATA);