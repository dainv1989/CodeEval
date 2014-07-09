####################################################
# script name   : valid_parentheses.pl
# description   : 
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 25/10/2013
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
        # remove all whitespace
        $_ =~ s/\s//g;
        # remove all non-parentheses characters
        $_ =~ s/[^\(\)\{\}\[\]]//g;
        @chars = split("", $_);
        if($#chars % 2 == 0)
        {
            print "False\n";
        }
        else
        {
            my @invalid = ();
            for(my $i = 0; $i <= $#chars; $i++)
            {
                push(@invalid, $chars[$i]);
                my $pair = join '',$invalid[$#invalid-1],$invalid[$#invalid];
                if ($pair eq '()' ||
                    $pair eq '[]' ||
                    $pair eq '{}')
                {
                    pop(@invalid);
                    pop(@invalid);
                }
            }

            if(@invalid == 0)
            {
                print "True\n";
            }
            else
            {
                print "False\n";
            }
        }
    }
}

close(DATA);