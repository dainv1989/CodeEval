###############################################################
# script name	: beautiful_string.pl
# description	: determine the maximum beauty of a string
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

# the beauty point arrays
@beauty = (1..26);

foreach (@content)
{
    # if line is not empty
    if ($_ ne "")
    {
        my $max_beauty = 0;
        my @char;
        my @values;
        my %unique_char;
    
        # remove all whitespace character
        $_ =~ s/\s//g;
        # remove all non-alphabetical characters
        $_ =~ s/[^a-zA-Z]//g;
        # convert to lowercase
        $_ = lc($_);

        @chars = split("",$_);
        @unique_char{@chars} = ();

        # count appearances of each char in the sentence
        for $item(@chars)
        {
            $unique_char{$item} += 1;
        }

        # sort number of appearances in descending order
        @values = sort {$b <=> $a} values %unique_char;

        # calculate maximum beauty of the string
        for (my $i = 0; $i <= $#values; $i++)
        {
            $max_beauty += ($beauty[25 - $i] * $values[$i]);
        }
        # print out result
        print "$max_beauty\n";
    }
}