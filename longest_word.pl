####################################################
# script name   : longest_word.pl
# description   : print longest word in a sentence
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
    # get one by one word and push to an array
    @words = split(" ",$_);

    # determine the longest word in sentence
    my $index = 0;                              # index of longest word in array
    my $max_length = length($words[0]);         # length value

    for($i = 1; $i <= $#words; $i++)
    {
        $len = length($words[$i]);
        if ( $len > $max_length)
        {
            $index = $i;
            $max_length = $len;
        }
    }
    print "$words[$index]\n";
}

close DATA;