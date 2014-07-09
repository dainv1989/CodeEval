####################################################
# script name   : string_rotation.pl
# description   : Determine if the 2nd string is a rotation of 1st string
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
        $idx = index($_, ',');
        if($idx != -1)
        {
            $origin = substr($_, 0, $idx);
            $rotation = substr($_, $idx + 1, length($_) - $idx - 1);

            $len = length($origin);

            if($len == length($rotation))
            {
                $i = 0;
                $result = 0;

                while($result == 0 && $i < $len)
                {
                    # if the rotation is equal the original word
                    if($rotation eq $origin)
                    {
                        $result = 1;
                        print "True\n";
                    }
                    else
                    {
                        # shift last character to the beginning of string
                        $last = substr($rotation, $len - 1, 1);
                        $first = substr($rotation, 0, $len - 1);
                        # re-construct rotation word
                        $rotation = "$last$first";
                        $i++;
                    }
                }

                # if loop through over the length of string
                if($i == $len)
                {
                    print "False\n";
                }
            }
            else
            {
                print "False\n";
            }
        }
    }
}

close(DATA);