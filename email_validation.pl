####################################################
# script name   : email_validation.pl
# description   : Determine a string is a valid email or not
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
        # remove all heading/trailing whitespace
        $_ =~ s/^\s|\s\z//g;
        if ($_ =~ m/^[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9.-]+\.)+[a-zA-Z]{2,4}$/)
        {
            print "true\n";
        }
        else
        {
            print "false\n";
        }
    }
}

close(DATA);