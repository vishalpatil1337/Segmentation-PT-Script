#!/bin/bash

# Output file name
output_file="segment1_tcp.bat"

# Header for the output file
cat <<EOF > "$output_file"
#!/bin/bash

EOF

# Function to remove the /24 suffix from IP addresses
remove_suffix() {
    echo "${1%/*}"
}

# Prompt user if they want to remove -p- and -v options for fast scan
echo ""
read -p "Do you want to remove -p- and -v options for fast scan? (y/n): " remove_options

# Read subnet information from subnet.txt file
while IFS= read -r subnet_ip; do
    # Generate output filename based on subnet IP
    output_filename="${subnet_ip//\//-}"  # Replace slashes with hyphens
    output_filename="${output_filename//./-}"  # Replace dots with hyphens
    output_filename="${output_filename//-24/}"  # Remove -24 suffix
    output_filename+="_scan"
    
    # Write Nmap script to output file
    if [ "$remove_options" == "y" ]; then
        cat <<EOF >> "$output_file"
nmap -n -Pn -sS --max-retries 1 --min-rtt-timeout 500ms --max-rtt-timeout 3000ms --initial-rtt-timeout 500ms --defeat-rst-ratelimit --min-rate 450 --max-rate 5000 --disable-arp-ping -oA  $output_filename $(remove_suffix) $subnet_ip
EOF
    else
        cat <<EOF >> "$output_file"
nmap -n -Pn -sS -p- --max-retries 1 --min-rtt-timeout 500ms --max-rtt-timeout 3000ms --initial-rtt-timeout 500ms --defeat-rst-ratelimit --min-rate 450 --max-rate 5000 --disable-arp-ping -v -oA  $output_filename $(remove_suffix) $subnet_ip
EOF
    fi

done < subnet.txt

# Output the final result
echo "Nmap scripts have been generated in $output_file"

sleep 5;

echo "______________________________________________________________________________________"

output_file1="segment1_tcp.sh"

# Header for the output file
cat <<EOF > "$output_file1"
#!/bin/bash

EOF

# Function to remove the /24 suffix from IP addresses
remove_suffix() {
    echo "${1%/*}"
}

# Prompt user if they want to remove -p- and -v options for fast scan
echo ""
read -p "Do you want to remove -p- and -v options for fast scan? (y/n): " remove_options


# Read subnet information from subnet.txt file
while IFS= read -r subnet_ip; do
    # Generate output filename based on subnet IP
    output_filename="${subnet_ip//\//-}"  # Replace slashes with hyphens
    output_filename="${output_filename//./-}"  # Replace dots with hyphens
    output_filename="${output_filename//-24/}"  # Remove -24 suffix
    output_filename+="_scan"
    
    # Write Nmap script to output file
    if [ "$remove_options" == "y" ]; then
        cat <<EOF >> "$output_file"
nmap -n -Pn -sS --max-retries 1 --min-rtt-timeout 500ms --max-rtt-timeout 3000ms --initial-rtt-timeout 500ms --defeat-rst-ratelimit --min-rate 450 --max-rate 5000 --disable-arp-ping -oA $output_filename $(remove_suffix) $subnet_ip
EOF
    else
        cat <<EOF >> "$output_file"
nmap -n -Pn -sS -p- --max-retries 1 --min-rtt-timeout 500ms --max-rtt-timeout 3000ms --initial-rtt-timeout 500ms --defeat-rst-ratelimit --min-rate 450 --max-rate 5000 --disable-arp-ping -v -oA $output_filename $(remove_suffix) $subnet_ip
EOF
    fi

done < subnet.txt

# Output the final result
echo "Nmap scripts have been generated in $output_file1"

sleep 5;

echo "______________________________________________________________________________________"


output_file2="segment1_udp.bat"

# Header for the output file
cat <<EOF > "$output_file2"
#!/bin/bash

EOF

# Function to remove the /24 suffix from IP addresses
remove_suffix() {
    echo "${1%/*}"
}

# Read subnet information from subnet.txt file
while IFS= read -r subnet_ip; do
    # Generate output filename based on subnet IP
    output_filename="${subnet_ip//\//-}"  # Replace slashes with hyphens
    output_filename="${output_filename//./-}"  # Replace dots with hyphens
    output_filename="${output_filename//-24/}"  # Remove -24 suffix
    output_filename+="_scan"
    
    # Write Nmap script to output file
    cat <<EOF >> "$output_file2"
nmap -n -Pn -sU -p U:7,9,11,13,17,19,37,53,67-69,88,111,123,135,137-139,161-162,177,213,259-260,445,464,500,514,520,523,623,631,749-751,1194,1434,1701,1812-1813,1900,2049,2746,3230-3235,3401,4045,4500,4665-4666,4672,5059-5061,5351,5353,5632,6429,7777,9100-9102,11211,17185,18233,23945,26000-26004,26198,27015-27030,27444,27960-27964,30720-30724,31337,32771,34555,44400,47545,49152,54321 --max-retries 1 --min-rtt-timeout 500ms --max-rtt-timeout 3000ms --initial-rtt-timeout 500ms --min-rate 450 --max-rate 5000 --disable-arp-ping -v -oA $output_filename $(remove_suffix) $subnet_ip
EOF

done < subnet.txt

# Output the final result
echo ""
echo "Nmap scripts have been generated in $output_file2"

sleep 5;


echo "______________________________________________________________________________________"

output_file3="segment1_udp.sh"

# Header for the output file
cat <<EOF > "$output_file3"
#!/bin/bash

EOF

# Function to remove the /24 suffix from IP addresses
remove_suffix() {
    echo "${1%/*}"
}

# Read subnet information from subnet.txt file
while IFS= read -r subnet_ip; do
    # Generate output filename based on subnet IP
    output_filename="${subnet_ip//\//-}"  # Replace slashes with hyphens
    output_filename="${output_filename//./-}"  # Replace dots with hyphens
    output_filename="${output_filename//-24/}"  # Remove -24 suffix
    output_filename+="_scan"
    
    # Write Nmap script to output file
    cat <<EOF >> "$output_file3"
nmap -n -Pn -sU -p U:7,9,11,13,17,19,37,53,67-69,88,111,123,135,137-139,161-162,177,213,259-260,445,464,500,514,520,523,623,631,749-751,1194,1434,1701,1812-1813,1900,2049,2746,3230-3235,3401,4045,4500,4665-4666,4672,5059-5061,5351,5353,5632,6429,7777,9100-9102,11211,17185,18233,23945,26000-26004,26198,27015-27030,27444,27960-27964,30720-30724,31337,32771,34555,44400,47545,49152,54321 --max-retries 1 --min-rtt-timeout 500ms --max-rtt-timeout 3000ms --initial-rtt-timeout 500ms --min-rate 450 --max-rate 5000 --disable-arp-ping -v -oA $output_filename $(remove_suffix) $subnet_ip
EOF

done < subnet.txt

# Output the final result
echo ""
echo "Nmap scripts have been generated in $output_file3"
echo ""
echo "Segmentation PT Scripts are ready"

