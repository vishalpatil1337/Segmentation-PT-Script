# Execute only the part "cat segment1_udp.sh"
with open('subnets_segment1_udp.sh', 'r') as f:
    segment1_content = f.read()
print(segment1_content)

# Save the entire script along with the output of "cat segment1_tcp.bat" to a new file called output2.bat
with open('final_segment1_udp.sh', 'w') as output_file:
    output_file.write('DEFAULT_ROUTE=$(ip route show default | awk \'/default/ {print $3}\')\n')
    output_file.write('ping -c 5 $DEFAULT_ROUTE > ping.txt\n')
    output_file.write('ifconfig > ipconfig.txt\n')
    output_file.write(segment1_content)
    output_file.write('printf "Script Execution Complete"')
