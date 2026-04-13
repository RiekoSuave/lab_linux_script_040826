#!/usr/bin/env bash

## What is the technical term for the code on Line 1?
## Answer: It is called a "shebang".
## What does it accomplish?
## Answer: It tells the system which interpreter to use to run the script (in this case, Bash).

# ----------------------------
# Simple File Processing Script
# ----------------------------

## Explain lines below. What are they and where are they used later in the script?
## Answer:
## These are variables. They store file paths and directory names.
## INPUT_FILE is used to read the input data.
## OUTPUT_DIR is used when creating the directory.
## OUTPUT_FILE is used when writing processed results.

INPUT_FILE="input/text.txt"
OUTPUT_DIR="output"
OUTPUT_FILE="$OUTPUT_DIR/fruits_processed.txt"

# Create output directory if it does not exist
mkdir -p "$OUTPUT_DIR"

# Question: What does mkdir -p do?
# Answer: It creates the directory and prevents errors if it already exists.

# see if you can get the output on line 20 by intentionally causing an error.
# Example: rename or delete input/fruits.txt to trigger the error message

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

echo "Processing file..."

# NEW FUNCTIONALITY:
# Clear output file before writing (prevents duplicate data)
> "$OUTPUT_FILE"

# NEW FUNCTIONALITY:
# Count number of processed lines
line_count=0

# NEW FUNCTIONALITY:
# Ask user for a custom prefix
echo "Enter a prefix (default is PROCESSED):"
read prefix

# Use default if user enters nothing
if [ -z "$prefix" ]; then
    prefix="PROCESSED"
fi

# Question: What does read do?
# Answer: It takes input from the user and stores it in a variable.

while IFS= read -r line
do
    # Convert text to uppercase
    processed_line="$prefix: $(echo "$line" | tr '[:lower:]' '[:upper:]')"

    # Question: What does tr do?
    # Answer: It translates characters (used here to convert lowercase to uppercase).

    echo "$processed_line" >> "$OUTPUT_FILE"

    ((line_count++))

done < "$INPUT_FILE"

echo "Done!"
echo "Total lines processed: $line_count"
echo "Output written to: $OUTPUT_FILE"