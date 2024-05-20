#!/usr/bin/perl
use strict;
use warnings;

my $protein_file = ; # Add file name
chomp($protein_file);

my $id_file =  ; # Add file name
chomp($id_file);

my $output_file =  ; # Add file name
chomp($output_file);

# Open the input protein file
open my $IN, '<', $protein_file or die "Cannot open $protein_file: $!";

# Initialize a hash to store sequences
my %hash;
local $/ = ">";  # Change the input record separator
readline($IN);   # Skip the first empty record

while (my $line = <$IN>) {
    chomp $line;
    $line =~ s/>//;
    my ($name, $seq) = split(/\n/, $line, 2);
    $seq =~ s/\n| |>//g;  # Remove newlines, spaces, and '>'
    $hash{$name} = $seq;
}

close $IN;

# Open the input ID file and output file
open my $IN1, '<', $id_file or die "Cannot open $id_file: $!";
open my $OUT, '>>', $output_file or die "Cannot open $output_file: $!";

# Process each ID and print the corresponding sequence
while (my $seq = <$IN1>) {
    chomp $seq;
    my @ids = split(/\n/, $seq);
    foreach my $id (@ids) {
        if (my $sequence = $hash{$id}) {
            print $OUT ">$id\n$sequence\n";
        } else {
            print "Sorry, $id has not been found in the database\n";
        }
    }
}

close $IN1;
close $OUT;

