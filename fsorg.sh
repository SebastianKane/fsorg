#!/usr/bin/env bash

# organize_by_month.sh
# Organizes all subdirectories of a given parent directory into folders based on Year-Month.

# Check if the user provided a target directory as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 /path/to/parent_directory"
    exit 1
fi

TARGET_DIR="$1"

# Ensure the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: $TARGET_DIR does not exist or is not a directory."
    exit 1
fi

# Navigate to the target directory
cd "$TARGET_DIR" || { echo "Unable to cd into $TARGET_DIR"; exit 1; }

# Iterate over all directories inside the target directory
for dir in */; do
    # Ensure it's a directory and not something else
    [ -d "$dir" ] || continue

    # Remove trailing slash for convenience
    dir_name="${dir%/}"

    # Use stat to get the last modification time in a sortable format: YYYY-MM-DD HH:MM:SS
    mod_time=$(stat -c %y "$dir_name")

    # Extract Year and Month
    year=$(echo "$mod_time" | cut -d ' ' -f1 | cut -d '-' -f1)
    month=$(echo "$mod_time" | cut -d ' ' -f1 | cut -d '-' -f2)

    # Construct the Year-Month directory name
    ym_dir="${year}-${month}"

    # Create the directory if it doesn't exist
    [ -d "$ym_dir" ] || mkdir "$ym_dir"

    # Move the directory into its Year-Month directory
    mv "$dir_name" "$ym_dir"/
done

echo "Organization complete."
