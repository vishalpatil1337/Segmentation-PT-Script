import glob

# List all partition files
partition_files = glob.glob('partition_*_subnets_segment1_tcp.sh')

# Iterate over partition files
for partition_file in partition_files:
    # Extract partition number from the filename
    partition_number = partition_file.split('_')[1]

    # Read content of the partition file
    with open(partition_file, 'r') as f:
        partition_content = f.read()

    # Write content to the corresponding output file
    output_file_name = f'final_segment1_tcp_partition_{partition_number}.sh'
    with open(output_file_name, 'w') as output_file:
        output_file.write('DEFAULT_ROUTE=$(ip route show default | awk \'/default/ {print $3}\')\n')
        output_file.write('ping -c 5 $DEFAULT_ROUTE > ping.txt\n')
        output_file.write('ifconfig > ipconfig.txt\n')
        output_file.write(partition_content)
        output_file.write('printf "Script Execution Complete"\n')
