#!/usr/bin/perl
use strict;
use warnings;

# Get list of .list files in the current directory
my @list = glob("./*.list");

foreach my $file (@list) {
    if ($file =~ /\.\/(\S+)\.list$/) {
        my $title = $1;
        open my $IN, '<', "$title.list" or die "Cannot open $title.list: $!";
        open my $OUT, '>', "parsed_ogs/$title.txt" or die "Cannot create parsed_ogs/$title.txt: $!";

        while (my $line = <$IN>) {
            chomp $line;
            my @columns = split(/\s+/, $line);
            print $OUT "$columns[0]\t$columns[2]\n";  # Assuming columns[0] and columns[2] are the required fields
        }

        close $IN;
        close $OUT;
    }
}
