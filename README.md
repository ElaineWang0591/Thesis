#### Steps to add the README to your repository
1. Save the above text to a file named `README.md`.
2. Add the `README.md` file to your repository:
   ```bash
   git add README.md
   git commit -m "Add README file"
   git push origin main

#### 1. clean_fasta.pl
1. Reads all .faa files in the current directory.
2. Extracts the title of each file.
3. Cleans the sequences by removing extraneous information from the headers.
4. Saves the cleaned sequences in the clean directory.

#### 2. parse_orthogroup_list.pl
1. Reads all .list files from OrthoFinder result in the current directory.
2. Extracts the title of each file.
3. Parses the sequences by extracting specific columns (e.g., the first and third columns).
4. Saves the parsed data in the parsed_ogs directory.

#### 4. prefix_protein_id.pl
1. Save the script to a file, e.g., prefix_gene_id.pl.
2. Ensure the .pep.fa files you want to process are in the same directory as the script.
3. Run the script using perl prefix_gene_id.pl.

#### 5. split_idlist_by_species.pl
1. Using strict and warnings: To enforce good coding practices.
2. Reading the Input File: The script reads an input file named idlist.txt.
3. Processing Each Line: It processes each line to extract the species name and ID.
4. Storing Data: The IDs are stored in a hash of arrays, keyed by species name.
5. Creating Output Directory: An output directory named species_id_lists is created if it doesn't already exist.
6. Writing Output Files: The IDs are written to separate files for each species, named species_id_lists/${species}_idlist.txt.

#### 6. split_protein_sequences_by_species.pl
1. Using strict and warnings: To enforce good coding practices.
2. Reading the Input File: The script reads an input file named protein_sequences.txt.
3. Processing Each Line: It processes each line to extract the species name and sequence.
4. Storing Data: The sequences are stored in a hash of arrays, keyed by species name.
5. Creating Output Directory: An output directory named species_protein_sequences is created if it doesn't already exist.
6. Writing Output Files: The sequences are written to separate files for each species, named species_protein_sequences/${species}_proteins.txt.

#### 7. remove_pseudogenes.pl
1. Using strict and warnings: To enforce good coding practices.
2. Reading the Input File: The script reads an input file named genes.txt.
3. Filtering Lines: It skips lines containing the word "pseudogene" (case-insensitive).
4. Writing the Output File: The filtered lines are written to an output file named filtered_genes.txt.

