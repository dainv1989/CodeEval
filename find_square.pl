####################################################
# script name   : find_square.pl
# description   : Check whether 4 points make a square
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

foreach $line(@content)
{
    if($line ne "")
    {
        # remove all characters which are not commas or digits
        $line =~ s/[^,-\d]//g;
        # get all coordinates to an array
        @a = split(",", $line);

        my %distances = ();
        for(my $i = 0; $i < 3; $i++)
        {
            for(my $j = $i + 1; $j <= 3; $j++)
            {
                # calculate distance between 2 points
                my $ab = ($a[2*$i] - $a[2*$j])**2 + ($a[2*$i + 1] - $a[2*$j + 1])**2;

                # add to %distances if not exists
                if(not exists($distances{$ab}))
                {
                    $distances{$ab} = 0;
                }
            }
        }

        # square definition
        # 4 sides' length are equal
        # 2 diagonals' length are equal
        my @d = keys %distances;
        # if there is exactly 2 values of distance in table
        # 4 points make a square
        if ($#d == 1)
        {
            print "true\n";
        }
        else
        {
            print "false\n";
        }
    }
}

close(DATA);