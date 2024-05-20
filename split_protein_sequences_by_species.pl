#!/usr/bin/perl
use strict;
use warnings;

# Input file name
my $input_file = 'protein_sequences.txt';

# Hash to store sequences by species
my %species_data;

# Open the input file for reading
open my $IN, '<', $input_file or die "Cannot open $input_file: $!";

# Read the input file line by line
while (my $line = <$IN>) {
    chomp $line;

    # Skip empty lines
    next if $line =~ /^\s*$/;

    # Extract the species part and the sequence
    if ($line =~ /^([^_]+)_(.+)$/) {
        my $species = $1;
        my $sequence = $2;
        push @{$species_data{$species}}, $sequence;
    } else {
        warn "Line $. is improperly formatted: $line\n";
    }
}

close $IN;

# Create output directory if it doesn't exist
my $output_dir = 'species_protein_sequences';
mkdir $output_dir unless -d $output_dir;

# Write each species' sequences to a separate file
foreach my $species (keys %species_data) {
    my $output_file = "$output_dir/${species}_proteins.txt";
    open my $OUT, '>', $output_file or die "Cannot create $output_file: $!";

    foreach my $sequence (@{$species_data{$species}}) {
        print $OUT "$sequence\n";
    }

    close $OUT;
}
