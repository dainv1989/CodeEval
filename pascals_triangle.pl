####################################################
# script name   : pascals_triangle.pl
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
        my @pascals = ();
        my @previous_line = ();

        for(my $i = 0; $i < $_; $i++)
        {
            my @line = ();
            $line[0] = 1;
            $line[$i] = 1;
            # caculate all elements of each line
            for(my $j = 1; $j < $i; $j++)
            {
                $line[$j] = $previous_line[$j] + $previous_line[$j - 1];
            }
            # add new line to pascals trianlge
            @pascals = (@pascals, @line);
            # re-assign current line to previous_line
            @previous_line = @line[0..$#line];
        }
        print join " ", @pascals;
        print "\n";
    }
}

close(DATA);