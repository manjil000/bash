#!/bin/bash

# Write PATH to file
echo "$PATH" > path.txt

# Split PATH into one directory per line
tr ':' '\n' < path.txt > new_path.txt

# Loop through each PATH directory
#IFS empty means Don’t split lines at spaces or tabs — just read the whole line.(to prevent path with spaces rare)
#read reads one line from a file
#-r prevents backslashes (\) from being treated specially
#dir is the variable that will hold the line
while IFS= read -r dir; do #“Read the file line by line, and each line becomes the variable $dir.
    # Skip empty or non-directory entries
    [ -d "$dir" ] || continue

#These are test brackets. Is $dir a directory? [-d "$dir"] 
#-d are test flags -d to check if something is a directory
#-f to check if something is a regular file ---->Used to skip weird entries like subfolders, symlinks, or glob failures.

    # Loop through each file in that directory
    for file in "$dir"/*; do
        # Skip if glob didn't match or isn't a file
        [ -f "$file" ] || continue


        # Check which package owns the file (quiet)
        dpkg --search "$file" 1>/dev/null
    done
done < new_path.txt

