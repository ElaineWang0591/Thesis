## Steps to add the README to your repository
1. Save the above text to a file named `README.md`.
   
2. Add the `README.md` file to your repository:
   ```bash
   git add README.md
   git commit -m "Add README file"
   git push origin main

## Script Descriptions
1. clean_fasta_sequence.pl
Reads all .faa files in the current directory.
Extracts the title of each file.
Cleans the sequences by removing extraneous information from the headers.
Saves the cleaned sequences in the clean directory.

2. extract_protein_sequences.pl
Reads gene-specific protein ID files.
Extracts corresponding protein sequences from species-specific proteome files. 
The extracted sequences are saved in a specified output directory.

3. parse_orthogroup_list.pl
Reads all .list files from OrthoFinder results in the current directory.
Extracts the title of each file.
Parses the sequences by extracting specific columns (e.g., the first and third columns).
Saves the parsed data in the parsed_ogs directory.

4. prefix_protein_id.pl
Reads all .pep.fa files in the current directory.
Adds a prefix to each gene ID in the headers.
Saves the modified sequences to new files in the clean directory.

5. process_gene_id.pl
Prompts the user to enter input and output directory paths.
Reads .txt files from the input directory.
Extracts gene IDs from the .txt files and stores them in a hash.
Reads corresponding .gff files and processes mRNA, CDS, and gene features.
Writes the processed data to .genelist files in the output directory.

6. split_idlist_by_species.pl
Reads an input file named idlist.txt.
Processes each line to extract the species name and ID.
Stores the IDs in a hash of arrays, keyed by species name.
Creates an output directory named species_id_lists if it doesn't already exist.
Writes the IDs to separate files for each species in species_id_lists/${species}_idlist.txt.

7. split_protein_sequences_by_species.pl
Reads an input file named protein_sequences.txt.
Processes each line to extract the species name and sequence.
Stores the sequences in a hash of arrays, keyed by species name.
Creates an output directory named species_protein_sequences if it doesn't already exist.
Writes the sequences to separate files for each species in species_protein_sequences/${species}_proteins.txt.

8. remove_pseudogenes.pl
Reads an input file named genes.txt.
Skips lines containing the word "pseudogene" (case-insensitive).
Writes the filtered lines to an output file named filtered_genes.txt.


This README provides a clean and concise summary of the scripts and their functions.
