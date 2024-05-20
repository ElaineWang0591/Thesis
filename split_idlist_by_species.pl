#!/usr/bin/perl
use strict;
use warnings;

# Input file name
my $input_file = 'idlist.txt';

# Hash to store IDs by species
my %species_data;

# Open the input file for reading
open my $IN, '<', $input_file or die "Cannot open $input_file: $!";

# Read the input file line by line
while (my $line = <$IN>) {
    chomp $line;

    # Skip empty lines
    next if $line =~ /^\s*$/;

    # Extract the species part and the ID
    if ($line =~ /^([^_]+)_(.+)$/) {
        my $species = $1;
        my $id = $2;
        push @{$species_data{$species}}, $id;
    } else {
        warn "Line $. is improperly formatted: $line\n";
    }
}

close $IN;

# Create output directory if it doesn't exist
my $output_dir = 'species_id_lists';
mkdir $output_dir unless -d $output_dir;

# Write each species' IDs to a separate file
foreach my $species (keys %species_data) {
    my $output_file = "$output_dir/${species}_idlist.txt";
    open my $OUT, '>', $output_file or die "Cannot create $output_file: $!";

    foreach my $id (@{$species_data{$species}}) {
        print $OUT "$id\n";
    }

    close $OUT;
}
