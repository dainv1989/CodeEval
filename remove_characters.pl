####################################################
# script name   : remove_characters.pl
# description   : Remove specific characters from a string
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 21/10/2013
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
        # split the sentence and specific characters
        my @line = split(",", $_);
        # trim out leading/trailing whitespace
        $line[0] =~ s/\A\s|\s\z//g;
        $line[1] =~ s/\s//g;
        # split every characters
        my @sentence = split("",$line[0]);
        my @chars = split("",$line[1]);

        for (my $i = 0; $i <= $#sentence; $i++)
        {
            # remove char if it exists in hash
            foreach $char(@chars)
            {
                if ($sentence[$i] eq $char)
                {
                    $sentence[$i] = "";
                }
            }
        }
        # print out result
        print join "",@sentence,"\n";
    }
}

close(DATA);