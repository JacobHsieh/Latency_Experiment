#! /bin/bash

evccMAC=`cat evccMAC.txt`  
seccMAC=`cat seccMAC.txt`  

echo "EVCC MAC Address:" ${evccMAC}
echo "SECC MAC Address:" ${seccMAC}

tshark -r evcc.pcapng -Y "eth.src == ${evccMAC} and (eth.dst == ${seccMAC} or eth.dst == 33:33:00:00:00:01) and (tcp or udp) and ipv6 and (not mdns)" \
-T fields -e frame.number -e frame.time_relative -e tcp.seq -E header=y -E separator=, -E quote=n > csv/evcc_send.csv

tshark -r evcc.pcapng -Y "eth.src ==  ${seccMAC} and eth.dst == ${evccMAC} and (tcp or udp) and ipv6 and (not mdns)" \
-T fields -e frame.number -e frame.time_relative -e tcp.seq -E header=y -E separator=, -E quote=n > csv/evcc_receive.csv

tshark -r secc.pcapng -Y "eth.src == ${evccMAC} and (eth.dst == ${seccMAC} or eth.dst == 33:33:00:00:00:01) and (tcp or udp) and ipv6 and (not mdns)" \
-T fields -e frame.number -e frame.time_relative -e tcp.seq -E header=y -E separator=, -E quote=n > csv/secc_receive.csv

tshark -r secc.pcapng -Y "eth.src ==  ${seccMAC} and eth.dst == ${evccMAC} and (tcp or udp) and ipv6 and (not mdns)" \
-T fields -e frame.number -e frame.time_relative -e tcp.seq -E header=y -E separator=, -E quote=n > csv/secc_send.csv