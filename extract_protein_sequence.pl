#!/usr/bin/perl
use strict;
use warnings;

# Input and output directories
my $proteome_path = './proteomes/';
my $id_files_path = './seqs/';
my $output_dir = './extracted_seqs/';

# Create output directory if it doesn't exist
mkdir $output_dir unless -d $output_dir;

# Read each gene-specific ID file
opendir(my $dh, $id_files_path) or die "Cannot open directory: $id_files_path";
my @id_files = grep { /\.txt$/ } readdir($dh);
closedir $dh;

foreach my $file (@id_files) {
    my $gene_name = $file;
    $gene_name =~ s/\.txt$//; # Remove file extension to get the gene name

    # Read protein IDs for the gene
    open my $fh, '<', "$id_files_path/$file" or die "Cannot open file $file: $!";
    my %species_to_ids;
    while (my $line = <$fh>) {
        chomp $line;
        my ($species, $ids) = split /\t/, $line;
        $species_to_ids{$species} = [split /, /, $ids]; # Store species with array of IDs
    }
    close $fh;

    # Open the output file for the gene sequences
    open my $out, '>', "$output_dir/${gene_name}_protein.fa" or die "Cannot open output file: $!";

    # Check and process each species' proteome file
    foreach my $species (keys %species_to_ids) {
        my $proteome_file = "$proteome_path/$species.fa";
        if (-e $proteome_file) {
            open my $in, '<', $proteome_file or die "Cannot open file $proteome_file: $!";
            local $/ = ">"; # Change the input record separator
            readline($in); # Skip the first empty record
            while (my $entry = <$in>) {
                chomp $entry;
                my ($header, @sequence) = split /\n/, $entry;
                my ($id) = split /\s/, $header; # Assuming IDs are the first part of the header
                my $sequence = join '', @sequence; # Reassemble the sequence

                if (grep { $_ eq $id } @{$species_to_ids{$species}}) {
                    print $out ">$species\_$id\n$sequence\n";
                }
            }
            close $in;
        } else {
            print "Warning: Proteome file for $species not found.\n";
        }
    }

    close $out;
    print "Sequences extracted for $gene_name\n";
}

