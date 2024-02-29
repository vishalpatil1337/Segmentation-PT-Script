mkdir -p Segmentation-PT-Partitions/windows/TCP
mkdir -p Segmentation-PT-Partitions/windows/UDP
mkdir -p Segmentation-PT-Partitions/linux/TCP
mkdir -p Segmentation-PT-Partitions/linux/UDP

mv subnets_segment1_tcp.bat Segmentation-PT-Partitions/windows/TCP
mv subnets_segment1_tcp.sh Segmentation-PT-Partitions/linux/TCP
mv subnets_segment1_udp.sh Segmentation-PT-Partitions/linux/UDP
mv subnets_segment1_udp.bat Segmentation-PT-Partitions/windows/UDP

cp parts.sh Segmentation-PT-Partitions/linux/TCP
cp parts.sh Segmentation-PT-Partitions/linux/UDP
cp parts.sh Segmentation-PT-Partitions/windows/TCP
cp parts.sh Segmentation-PT-Partitions/windows/UDP

echo "Write number of Partitions for Windows_TCP"
cd Segmentation-PT-Partitions/windows/TCP
./parts.sh subnets_segment1_tcp.bat
cd ../../../
cp subnet-tcp1.py Segmentation-PT-Partitions/windows/TCP/subnets_segment1
cd Segmentation-PT-Partitions/windows/TCP/subnets_segment1
python subnet-tcp1.py
rm partition* subnet*
cd ../../../../


echo "Write number of Partitions for Windows_UDP"
cd Segmentation-PT-Partitions/windows/UDP
./parts.sh subnets_segment1_udp.bat
cd ../../../
cp subnet-udp1.py Segmentation-PT-Partitions/windows/UDP/subnets_segment1
cd Segmentation-PT-Partitions/windows/UDP/subnets_segment1
python subnet-udp1.py 
rm partition* subnet*
cd ../../../../

echo "Write number of Partitions for Linux_TCP"
cd Segmentation-PT-Partitions/linux/TCP
./parts.sh subnets_segment1_tcp.sh
cd ../../../
cp subnet-tcp2.py Segmentation-PT-Partitions/linux/TCP/subnets_segment1
cd Segmentation-PT-Partitions/linux/TCP/subnets_segment1
python subnet-tcp2.py 
rm partition* subnet*
cd ../../../../

echo "Write number of Partitions for Linux_UDP"
cd Segmentation-PT-Partitions/linux/UDP
./parts.sh subnets_segment1_udp.sh
cd ../../../
cp subnet-udp2.py Segmentation-PT-Partitions/linux/UDP/subnets_segment1
cd Segmentation-PT-Partitions/linux/UDP/subnets_segment1
python subnet-udp2.py 
rm partition* subnet*
cd ../../../../

dos2unix Segmentation-PT-Partitions/linux/TCP/subnets_segment1/final_segment1_tcp_partition_*
dos2unix Segmentation-PT-Partitions/linux/UDP/subnets_segment1/final_segment1_udp_partition_*


