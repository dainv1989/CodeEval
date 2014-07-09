####################################################
# script name   : overlapping_retangles.pl
# description   : 
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 29/10/2013
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
        # remove all whitespace in a line
        $_ =~ s/\s//g;
        # get coordinates of 2 rectangles
        @xy = split(",", $_);

        # array index       :   0,1,      2,3,        4,5,        6,7
        # Rectangles A, B   : Xa1, Ya1,   Xa2, Ya2,   Xb1, Yb1,   Xb2, Yb2
        # overlapping condition
        # (Xb1 - Xa2)*(Xb2 - Xa1) <= 0 and
        # (Yb1 - Ya2)*(Yb2 - Ya2) <= 0
        if( ($xy[4] - $xy[2])*($xy[6] - $xy[0]) <= 0 &&
            ($xy[5] - $xy[3])*($xy[7] - $xy[1]) <= 0)
        {
            print "True\n";
        }
        else
        {
            print "False\n";
        }
    }
}

close(DATA);