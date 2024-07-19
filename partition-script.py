import os

# Specify the path where the folder should be
folder_path = 'Segmentation-PT-Partitions'

# List of files to be removed
files_to_remove = [
    'Segmentation-PT-Partitions/linux/TCP/parts.sh',
    'Segmentation-PT-Partitions/linux/TCP/subnets_segment1_tcp.sh',
    'Segmentation-PT-Partitions/linux/UDP/parts.sh',
    'Segmentation-PT-Partitions/linux/UDP/subnets_segment1_udp.sh',
    'Segmentation-PT-Partitions/windows/TCP/parts.sh',
    'Segmentation-PT-Partitions/windows/TCP/subnets_segment1_tcp.bat',
    'Segmentation-PT-Partitions/windows/UDP/parts.sh',
    'Segmentation-PT-Partitions/windows/UDP/subnets_segment1_udp.bat'
]

# Check if the folder exists
if os.path.isdir(folder_path):
    # Loop through and remove each file
    for file in files_to_remove:
        try:
            os.remove(file)
            print(f"Removed {file}")
        except FileNotFoundError:
            print(f"File not found: {file}")
        except Exception as e:
            print(f"Error removing {file}: {e}")
else:
    print("Folder not found. No action taken.")
