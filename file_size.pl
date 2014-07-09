####################################################
# script name   : file_size.pl
# description   : print out file size in byte unit
# author        : Dai Nguyen-Van
# email         : dainv1989@gmail.com
# creation date : 11/10/2013
####################################################
#
#!/usr/bin/perl

# open file in read-only mode
# read content of input file
$size = -s $ARGV[0];
print $size;