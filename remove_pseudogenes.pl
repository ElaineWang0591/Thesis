#!/usr/bin/perl
use strict;
use warnings;

# Input and output file names
my $input_file = 'genes.txt';
my $output_file = 'filtered_genes.txt';

# Open the input file for reading
open my $IN, '<', $input_file or die "Cannot open $input_file: $!";

# Open the output file for writing
open my $OUT, '>', $output_file or die "Cannot open $output_file: $!";

# Read the input file line by line
while (my $line = <$IN>) {
    chomp $line;

    # Skip lines that contain "pseudogene"
    next if $line =~ /pseudogene/i;

    # Print the line to the output file
    print $OUT "$line\n";
}

# Close the input and output files
close $IN;
close $OUT;
