###############################################################
# script name	: Pangrams.pl
# description	: print missing alphabetical characters in a sentence
# author		: Dai Nguyen-Van
# email			: dainv1989@gmail.com
# creation date	: 16/10/2013
###############################################################
#!/usr/bin/perl

# open input file
# read content
# remove EOL character
open (DATA, "<", $ARGV[0]) or die $!;
@content = <DATA>;
chomp(@content);

# array of all alphabetical characters
my @alphabet = (a..z);

foreach (@content)
{
    # check empty line
    if ($_ ne "")
    {
        my @char_missing = ();
        my @chars = ();
        my %char_unique;
        
        $_ =~ s/\s//g;              # remove whitepsace character
        $_ = lc($_);                # convert to lowercase
        @chars = split("",$_);      # split one by one character
        @char_unique{@chars} = ();  # get all unique characters in the sentence

        foreach $item(@alphabet)
        {
            if (exists($char_unique{$item}))
            {
                # this case alphabet character appears in the sentence
                # do nothing
            }
            else
            {
                # store missing char to an array
                push(@char_missing, $item);
            }
        }

        # print out result
        if (@char_missing != 0)
        {
            print join "",@char_missing,"\n";
        }
        else
        {
            print "NULL\n";
        }
    }
}

close(DATA);