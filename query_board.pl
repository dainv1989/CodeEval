###############################################################
# script name	: query_board.pl
# description	: query board simulator
# author		: Dai Nguyen-Van
# email			: dainv1989@gmail.com
# creation date	: 17/10/2013
###############################################################
#!/usr/bin/perl
my @board[0..255][0..255] = ();

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
        # convert input string to lowercase
        $_ = lc($_);
        # get parameters from an input string
        my @params = split(" ", $_);
        if ($params[0] eq "queryrow")
        {
            print "query row\n";
        }
        else
        {
            print "unknown command\n";
        }
    }
}

close(DATA);