# Organize by Month Script

## Overview

This Bash script organizes all subdirectories within a specified parent directory into folders named by their Year-Month. It extracts each subdirectory’s modification date using `stat`, derives a `YYYY-MM` format, creates a corresponding directory if necessary, and moves the subdirectory into it.

## Features

- **Automatic Organization:** Sorts subdirectories by their year-month timeframe.
- **No External Dependencies (beyond standard utilities):** Uses Bash, `stat`, `mkdir`, and `mv`.
- **Single Required Argument:** Specify the parent directory to be organized.

## Requirements

- A POSIX-compatible shell (tested with `bash`).
- GNU `stat` installed (commonly available on Linux systems).
- Proper permissions to create directories and move subdirectories in the target directory.

## Usage

1. Place `fsorg.sh` in your `$PATH` or in the desired directory.
2. Make the script executable:
   ```bash
   chmod +x fsorg.sh
