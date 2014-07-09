####################################################
# script name   : set_intersection.pl
# description   : Print out the intersection of these two sets
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
        my @array_num1 = ();
        my @array_num2 = ();

        $_ =~ s/\s//g;                  # remove all whitespace if any
        my $index = index($_, ";");     # get index of semicolon character

        if ($index != -1)
        {
            my @sets = ();              # set intersection numbers
            # separate 2 array string of numbers
            $array_str1 = substr($_, 0, $index);
            $array_str2 = substr($_, $index + 1, length($_) - $index - 1);

            # get 2 array of numbers
            @array_num1 = split(",",$array_str1);
            @array_num2 = split(",",$array_str2);

            my $i = 0;
            my $j = 0;
            # loop util reach the end one of two arrays
            while ($i <= $#array_num1 && $j <= $#array_num2)
            {
                if ($array_num1[$i] == $array_num2[$j])
                {
                    push(@sets, $array_num1[$i]);
                    $i++;
                    $j++;
                }
                elsif ($array_num1[$i] < $array_num2[$j])
                {
                    $i++;
                }
                elsif ($array_num1[$i] > $array_num2[$j])
                {
                    $j++;
                }
            }
            
            # print out result
            print join ",",@sets;
            print "\n";
        }
    }
}

close(DATA);