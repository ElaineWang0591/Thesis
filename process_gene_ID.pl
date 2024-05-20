#!/usr/bin/perl
use strict;
use warnings;
use File::Path qw(make_path);

# Prompt for input and output directories
print "Enter the input directory containing .txt files: ";
my $input_dir = <STDIN>;
chomp($input_dir);

print "Enter the input directory containing .gff files: ";
my $gff_dir = <STDIN>;
chomp($gff_dir);

print "Enter the output directory for the .genelist files: ";
my $output_dir = <STDIN>;
chomp($output_dir);

# Create the output directory if it doesn't exist
make_path($output_dir) unless -d $output_dir;

# Get list of .txt files in the input directory
my @list = glob("$input_dir/*.txt");

foreach my $file (@list) {
    if ($file =~ /$input_dir\/(\S+)\.txt$/) {
        my $title = $1;
        open my $IN1, '<', "$input_dir/$title.txt" or die "Cannot open $title.txt: $!";
        open my $IN2, '<', "$gff_dir/$title.gff" or die "Cannot open $title.gff: $!";
        open my $OUT, '>', "$output_dir/$title.genelist" or die "Cannot create $title.genelist: $!";

        my %gene;
        while (my $line1 = <$IN1>) {
            chomp $line1;
            my @aa = split(/\n|\s/, $line1);
            foreach my $aa (@aa) {
                $gene{$aa} = 1;
            }
        }

        my (%gene_id, %mrna_id);
        while (my $line = <$IN2>) {
            next if $line =~ /\#/;
            chomp $line;
            my @line = split(/\t/, $line);
            my $feature_type = $line[2];
            my $attributes = $line[8];

            if ($feature_type eq 'mRNA') {
                if ($attributes =~ /ID\=rna\-|ID\=transcript\:/) {
                    my $mrna_id = (split(/ID\=rna\-|ID\=transcript\:|\;/, $attributes))[1];
                    my $gene_id = (split(/\;Parent\=gene\-|\;Parent\=gene\:|\;/, $attributes))[1];
                    $mrna_id{$mrna_id} = $gene_id;
                }
            } elsif ($feature_type eq 'CDS') {
                if ($attributes =~ /ID\=cds\-|\;/) {
                    my $prot_id = (split(/ID\=cds\-|\;/, $attributes))[1];
                    if ($gene{$prot_id}) {
                        my $mrna_id = (split(/\;Parent\=rna\-|\;Parent\=transcript\:|\;/, $attributes))[1];
                        my $gene_id = $mrna_id{$mrna_id};
                        print $OUT "$prot_id\t$gene_id\n";
                    }
                }
            } elsif ($feature_type eq 'gene') {
                if ($attributes =~ /ID\=|\;Name\=/) {
                    my ($gene_id, $prot_id) = (split(/ID\=|\;Name\=/, $attributes))[1, 2];
                    if ($gene{$prot_id}) {
                        print $OUT "$prot_id\t$gene_id\n";
                    }
                }
            }
        }

        close $IN1;
        close $IN2;
        close $OUT;
    }
}
