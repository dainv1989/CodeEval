####################################################
# script name   : point_in_circle.pl
# description   : determine whether a point in a circle or not
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
        @points = split(";", $_);
        # remove unnecessary characters
        $points[0] =~ s/[^.,-\d]//g;
        $points[1] =~ s/[^.,-\d]//g;
        $points[2] =~ s/[^.,-\d]//g;

        # get parameter
        @center = split(",", $points[0]);
        $radius = $points[1];
        @point = split(",", $points[2]);

        # distance from my point to the center of circle
        $distance = sqrt(($point[0] - $center[0])**2 + ($point[1] - $center[1])**2);

        if ($distance <= $radius)
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