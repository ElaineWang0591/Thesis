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

2. parse_orthogroup_list.pl
Reads all .list files from OrthoFinder results in the current directory.
Extracts the title of each file.
Parses the sequences by extracting specific columns (e.g., the first and third columns).
Saves the parsed data in the parsed_ogs directory.

3. extract_protein_sequences.pl
Reads gene-specific protein ID files.
Extracts corresponding protein sequences from species-specific proteome files. 
The extracted sequences are saved in a specified output directory.

4. prefix_protein_id.pl
Reads all .pep.fa files in the current directory.
Adds a prefix to each gene ID in the headers.
Saves the modified sequences to new files in the clean directory.

5. split_idlist_by_species.pl
Reads an input file named idlist.txt.
Processes each line to extract the species name and ID.
Stores the IDs in a hash of arrays, keyed by species name.
Creates an output directory named species_id_lists if it doesn't already exist.
Writes the IDs to separate files for each species in species_id_lists/${species}_idlist.txt.

6. split_protein_sequences_by_species.pl
Reads an input file named protein_sequences.txt.
Processes each line to extract the species name and sequence.
Stores the sequences in a hash of arrays, keyed by species name.
Creates an output directory named species_protein_sequences if it doesn't already exist.
Writes the sequences to separate files for each species in species_protein_sequences/${species}_proteins.txt.

7. remove_pseudogenes.pl
Reads an input file named genes.txt.
Skips lines containing the word "pseudogene" (case-insensitive).
Writes the filtered lines to an output file named filtered_genes.txt.


This README provides a clean and concise summary of the scripts and their functions.
