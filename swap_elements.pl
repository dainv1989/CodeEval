####################################################
# script name   : swap_elements.pl
# description   : You are given a list of numbers which is supplemented with positions that have to be swapped.
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 16/10/2013
####################################################
#
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
        # find the position of colon character
        $idx = index($_, ":");
        # if colon character is exist
        if ($idx != -1)
        {
            # get array of numbers need to swap elements
            $array_str = substr($_, 0, $idx - 1);
            @array_num = split(" ", $array_str);

            # get swap positions
            $swap_str = substr($_, $idx + 1, length($_) - $idx - 1);
            @swap_arr_str = split(",", $swap_str);

            foreach $item(@swap_arr_str)
            {
                # remove all space character
                # get positions need to swap value
                $item =~ s/\s//g;
                @position = split("-", $item);

                # swap value using mediate variable
                my $mediate = $array_num[$position[0]];
                $array_num[$position[0]] = $array_num[$position[1]];
                $array_num[$position[1]] = $mediate;
            }
            # print out array of number after swap
            print join " ",@array_num;
            print "\n";
        }
    }
}

# close file handle
close(DATA);