####################################################
# script name   : endianness.pl
# description   : print out the endianness of the system
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 21/10/2013
####################################################
#!/usr/bin/perl
my $number = 0x01020304;
my @chars = unpack("c[4]", pack("i", $number));

if ($chars[0] == 0x01)
{
    print "BigEndian";
}
elsif($chars[0] == 0x04)
{
    print "LittleEndian";
}
else
{
    print "Unknown";
}