#!/usr/bin/perl
use strict;
use warnings;

# Get list of .pep.fa files in the current directory
my @list = glob("./*.pep.fa");

foreach my $file (@list) {
    if ($file =~ /\.\/(\S+)\.pep\.fa$/) {
        my $title = $1;
        open my $IN, '<', "$file" or die "Cannot open $file: $!";
        open my $OUT, '>', "$title.pep.fa.temp" or die "Cannot create $title.pep.fa.temp: $!";

        while (my $line = <$IN>) {
            chomp $line;
            if ($line =~ /^>(\S+)/) {
                print $OUT ">$title\_$1\n";
            } else {
                print $OUT "$line\n";
            }
        }

        close $IN;
        close $OUT;

        rename("$title.pep.fa.temp", "$title.pep.fa") or die "Cannot rename file: $!";
    }
}
