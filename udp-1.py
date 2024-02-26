# Execute only the part "cat segment1_udp.bat"
with open('subnets_segment1_udp.bat', 'r') as f:
    segment1_content = f.read()
print(segment1_content)

# Save the entire script along with the output of "cat segment1_tcp.bat" to a new file called output2.bat
with open('final_segment1_udp.bat', 'w') as output_file:
    output_file.write('for /f "tokens=2 delims=:" %%g in (\'netsh interface ip show address ^| findstr "Default Gateway"\') do ping %%g >> "Pingtestfor_"%%g".txt\n')
    output_file.write('ipconfig >> segment1_tcp.txt\n')
    output_file.write('set PATH=%PATH%;"C:\Program Files (x86)\Nmap"\n')
    output_file.write('set PATH=%PATH%;"C:\Program Files\Nmap"\n')
    output_file.write(segment1_content)
    output_file.write('printf "Script Execution Complete"')
