####################################################
# script name   : pass_triangle.pl
# description   : 
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 30/10/2013
####################################################
#!/usr/bin/perl

# open file in read-only mode
# read content of input file
# remove all end of line character (EOL)
open (DATA, "<", $ARGV[0]) or die $!;
@content = <DATA>;
chomp(@content);

my $max = $content[0];
my $idx = 0;
for(my $i = 1; $i <= $#content; $i++)
{
    my @nums = split(" ", $content[$i]);
    if($nums[$idx + 1] > $nums[$idx])
    {
        $idx = $idx + 1;
    }
    $max += $nums[$idx];
}
print "$max\n";

close(DATA);