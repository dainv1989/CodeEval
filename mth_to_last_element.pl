###############################################################
# script name	: mth_to_last_element.pl
# description	: 
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

foreach (@content)
{
    # check empty line
    if ($_ ne "")
    {
        my @chars = ();
        my $index = $_;
        $index =~ s/\s//g;          # remove all whitespace characters
        $index =~ s/[a-zA-Z]//g;    # remove all alphabetical characters
        $index = $index - 1;        # convert position base-1 to base-0

        $_ =~ s/\d//g;              # remove all digits in line
        @chars = split(' ', $_);
        if ($index <= $#chars)
        {
            # print out character at position stored by index
            print "$chars[$#chars - $index]\n";
        }
    }
}

close(DATA);