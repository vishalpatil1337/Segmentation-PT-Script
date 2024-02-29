import glob

# List all partition files
partition_files = glob.glob('partition_*_subnets_segment1_udp.bat')

# Iterate over partition files
for partition_file in partition_files:
    # Extract partition number from the filename
    partition_number = partition_file.split('_')[1]

    # Read content of the partition file
    with open(partition_file, 'r') as f:
        partition_content = f.read()

    # Write content to the corresponding output file
    output_file_name = f'final_segment1_udp_partition_{partition_number}.bat'
    with open(output_file_name, 'w') as output_file:
        output_file.write('for /f "tokens=2 delims=:" %%g in (\'netsh interface ip show address ^| findstr "Default Gateway"\') do ping %%g >> "Pingtestfor_"%%g".txt"\n')
        output_file.write('ipconfig >> segment1_udp.txt\n')
        output_file.write('set PATH=%PATH%;"C:\\\\Program Files (x86)\\\\Nmap"\n')  # Double the backslashes
        output_file.write('set PATH=%PATH%;"C:\\\\Program Files\\\\Nmap"\n')         # Double the backslashes
        output_file.write(partition_content)
        output_file.write('printf "Script Execution Complete"')
