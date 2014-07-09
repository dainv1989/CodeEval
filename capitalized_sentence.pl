####################################################
# script name   : reverse_words.pl
# description   : print reverse words of sentences get from a file
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 11/10/2013
####################################################
#
#!/usr/bin/perl

# open file in read-only mode
# read content of input file
# remove all end of line character (EOL)
open (DATA, "<", $ARGV[0]) or die $!;
@content = <DATA>;
chomp(@content);

foreach (@content)
{
    # print out capitalized each words of line
    # output has trailing space character
    @list = map {ucfirst} split(" ", $_);
    print join " ",@list,"\n";

=headl
    # print out without trailing space character
    print @list[$#list];
    for ($i = $#list - 1; $i >= 0; $i--)
    {
        $tmp = $list[$i];
        print " $tmp";
    }
    print "\n";
=cut
}

# close file handle
close DATA;