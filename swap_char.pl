########################################################
# file name     : swap_char.pl
# description   : 
# creation date : 21-01-2014
# author        : dainv
# update
#
########################################################
#!/usr/bin/perl
use v5.18;
use warnings;

sub swap {
    if (scalar(@_) != 1) { die; }
    if ($_[0] eq "") { die; }

    my @result = ();
    my @chars = split('', $_[0]);
    my $num = scalar(@chars);
    my $word = "";

    if ($num == 1) {
        push (@result, $chars[0]);
    }
    elsif ($num == 2) {
        $word = join("", @chars);
        push(@result, $word);
        $word = join("", reverse(@chars));
        push(@result, $word);
    }
    elsif ($num > 2) {
        for(my $i = 0; $i <= $#chars; $i++) {
            my $first = shift(@chars);
            my @tmp = swap(join('', @chars));
            foreach my $w(@tmp) {
                $word = join("", $first, $w);
                push(@result, $word);
            }
            push(@chars, $first);
        }
    }
    return (@result);
}

my $input = $ARGV[0] || "";
my @arr = swap($input);

for(my $i = 0; $i <= $#arr; $i++) {
    print "$arr[$i]\n";
}
