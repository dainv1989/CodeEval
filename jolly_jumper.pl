###############################################################
# script name	: jolly_jumper.pl
# description	: determine an array is jolly jumper array or not
# author		: Dai Nguyen-Van
# email			: dainv1989@gmail.com
# creation date	: 29/10/2013
###############################################################
#!/usr/bin/perl

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
        # get array of numbers
        my @numbers = split(" ", $_);
        my $n = @numbers;
        if($n == 1)
        {
            # by definition, any one element sequence is a JJ sequence
            print "Jolly\n";
        }
        elsif($n > 1)
        {
            my @diff = ();
            for(my $i = 1; $i < $n; $i++)
            {
                # get array of absolute the difference values between successive numbers
                push(@diff, abs($numbers[$i] - $numbers[$i - 1]));
            }
            # sort @diff array
            @diff = sort(@diff);
            # determine original sequence is a jolly jumper or not
            my $is_jolly = 1;
            for(my $j = 0; $j <= $#diff; $j++)
            {
                if($diff[$j] != ($j + 1))
                {
                    $is_jolly = 0;
                }
            }
            # print out result
            if($is_jolly == 1)
            {
                print "Jolly\n";
            }
            else
            {
                print "Not jolly\n";
            }
        }
    }
}

close(DATA);