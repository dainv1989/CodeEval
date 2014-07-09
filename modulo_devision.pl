####################################################
# script name   : modulo_devision.pl
# description   : print out value N mod M
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
    @nums = split(",", $_);
    $div = $nums[0] % $nums[1];
    print "$div\n";
}

# close file handle
close DATA;