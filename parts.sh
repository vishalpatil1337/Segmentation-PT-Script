#!/bin/bash

# Check if the script file name is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <script_file>"
    exit 1
fi

script_file="$1"
output_directory="subnets_segment1"

# Check if the script file exists
if [ ! -f "$script_file" ]; then
    echo "Error: Script file '$script_file' not found."
    exit 1
fi

# Check if the output directory exists, if not create it
if [ ! -d "$output_directory" ]; then
    mkdir -p "$output_directory"
fi

# Read the contents of the script file
script_content=$(<"$script_file")

# Split the script into individual Nmap commands
IFS=$'\n' read -d '' -ra nmap_commands <<< "$script_content"

# Prompt the user to specify the number of partitions
read -p "Enter the number of partitions: " num_partitions

# Calculate the number of commands per partition
num_commands=${#nmap_commands[@]}
commands_per_partition=$(( (num_commands + num_partitions - 1) / num_partitions ))

# Divide the Nmap commands into partitions
for ((i = 0; i < num_partitions; i++)); do
    start=$((i * commands_per_partition))
    end=$((start + commands_per_partition - 1))
    
    # Create partition file
    partition_file="${output_directory}/partition_${i}_${script_file}"
    touch "$partition_file"
    
    # Loop over commands and append to partition file
    for ((j = start; j <= end && j < num_commands; j++)); do
        echo "${nmap_commands[j]}" >> "$partition_file"
    done
done
