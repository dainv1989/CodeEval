####################################################
# script name   : multiply_list.pl
# description   : You have 2 lists of positive integers. 
#               : Write a program which multiplies corresponding elements in these lists.
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 14/10/2013
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
        # index of pipe character in line
        my $idx = index($_, "|");

        # check to assure that line contains pipe character
        if ($idx != -1)
        {
            my $list1 = substr($_, 0, $idx - 1);
            my $list2 = substr($_, $idx + 1, length($_) - $idx - 1);
            # get list of numbers
            my @arr1 = split(" ", $list1);
            my @arr2 = split(" ", $list2);

            # if 2 arrays have same number of elements
            if ($#arr1 == $#arr2)
            {
                my @multiply;
                for(my $i = 0; $i <= $#arr1; $i++)
                {
                    print $arr1[$i] * $arr2[$i];
                    print " ";
                }
            }
            print "\n";
        }
    }
}

close(DATA);