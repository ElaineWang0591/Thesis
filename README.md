



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



#### Steps to add the README to your repository
1. Save the above text to a file named `README.md`.
2. Add the `README.md` file to your repository:
   ```bash
   git add README.md
   git commit -m "Add README file"
   git push origin main
