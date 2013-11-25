###############################################################
# script name	: calculate_distance.pl
# description	: calculate distance between two points
# author		: Dai Nguyen-Van
# email			: dainv1989@gmail.com
# creation date	: 17/10/2013
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
        # remove all whitespace character
        $_ =~ s/\s//g;
        # split two points by couple brackets ")("
        my @points = split ('\)\(',$_);

        # remove all characters which are not dot, digits or dash
        $points[0] =~ s/[^,-\d]//g;
        $points[1] =~ s/[^,-\d]//g;

        # get coordinates of 2 points
        my @pointa = split(",", $points[0]);
        my @pointb = split(",", $points[1]);

        # calculate the distance between two points
        my $distance = sqrt (($pointa[0] -$pointb[0])**2 + ($pointa[1] -$pointb[1])**2);
        print "$distance\n";
    }
}

close(DATA);