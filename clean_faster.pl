#!/usr/bin/perl -w
use strict;
use warnings;

# Get list of .faa files in the current directory
my @list = glob("./*.faa");

foreach my $file (@list) {
    if ($file =~ /\.\/(\S*).faa$/) {
        my $title = $1;
        
        open my $IN, '<', "$title.faa" or die "Cannot open $title.faa: $!";
        open my $OUT, '>', "clean/$title.faa" or die "Cannot create clean/$title.faa: $!";
        
        while (my $line = <$IN>) {
            chomp $line;
            if ($line =~ />/) {
                my @line = split(/\s+/, $line);
                print $OUT "$line[0]\n";
            } else {
                print $OUT "$line\n";
            }
        }
        
        close $IN;
        close $OUT;
    }
}
