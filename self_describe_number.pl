###############################################################
# script name	: self_describe_number.pl
# description	: print missing alphabetical characters in a sentence
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
    # if line is not empty
    if ($_ ne "")
    {
        $_ =~ s/\s//g;              # remove all whitespace character
        my @numbers = split("",$_); # split all constituent digits

        my %nums;
        @nums{0..$#numbers} = ();
        # count appearances of constituent digits
        # and store it to a hash table
        foreach $item(@numbers)
        {
            if (exists($nums{$item}))
            {
                $nums{$item} += 1;
            }
        }

        # check self describe number
        my $self = 1;
        for(my $i = 0; $i <= $#numbers; $i++)
        {
            if ($nums{$i} != $numbers[$i])
            {
                $self = 0;
            }
        }
        # print out result
        print "$self\n";
    }
}