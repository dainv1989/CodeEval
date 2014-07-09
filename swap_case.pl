####################################################
# script name   : swap_case.pl
# description   : swaps letters' case in a sentence
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
    $_ =~ tr/a-zA-Z/A-Za-z/;
    print "$_\n";
}

close DATA;