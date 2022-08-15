# ISO-15118 Latency Experiment
This is the ISO 15118 wireless communication latency experiment. The objective is to
1. Analyze the impact on wireless communication latency by interference or coexistence.
2. Decrease the latency and the probability of timeout occurrence.

## Table of Contents
* [Experiment-1](#experiment-1)
* [Experiment-2](#experiment-2)
* [Packet Loss Rate Calculation](#packet-loss-rate-calculation)
* [Others](#others)

## Experiment-1
* <a href="0420_exp/"> 0420_exp </a>: Latency experiment above the transport layer.
  * <a href="0420_exp/csv/"> 0420_exp/csv/ </a>: Wireshark filtered TCP and UDP packets in csv in three scenarios.
    * <a href="0420_exp/csv/no_interfere_evcc_UDP_TCP.csv"> no_interfere_evcc_UDP_TCP.csv </a>
    * <a href="0420_exp/csv/2_interfere_evcc_UDP_TCP.csv"> 2_interfere_evcc_UDP_TCP.csv </a>
    * <a href="0420_exp/csv/4_interfere_evcc_UDP_TCP.csv"> 4_interfere_evcc_UDP_TCP.csv </a>

  * <a href="0420_exp/time_record/"> 0420_exp/time_record/ </a>: Result time logs in separate layers.
    * Definition: Each row represents a testing round, and normally, there will be 20 testing rounds (rows) if no timeout occurs. Column 0 to column 9 represent specific stages, and column 10 and column 11 represent general stages. Detail definition of stages please refer to the paper. It is worth noting that column 10 = column 0 + column 1, and column 11 = sum of column 0 to column 9. Column 12 and column 13 are not used in the paper. Column 12 represents the duration of the charging loop, which is related to the configuration (_ev.initial.battery.status_ in the config. file) we set at the beginning. Column 13 represents the duration from exiting the charging loop to session close.
    * Application layer time record: produced by _RISE-V2G_
      * <a href="0420_exp/time_record/no_interference.txt"> no_interference.txt </a>
      * <a href="0420_exp/time_record/2_interference.txt"> 2_interference.txt </a>
      * <a href="0420_exp/time_record/4_interference.txt"> 4_interference.txt </a>
    * Transport layer time record: produced by _pcap_csv_analysis.ipynb_
      * <a href="0420_exp/time_record/no_interference_TCP.txt"> no_interference_TCP.txt </a>
      * <a href="0420_exp/time_record/2_interference_TCP.txt"> 2_interference_TCP.txt </a>
      * <a href="0420_exp/time_record/4_interference_TCP.txt"> 4_interference_TCP.txt </a>
    * Application layer time record - Transport layer time record: produced by _Application_minus_TCP_processing.ipynb_
      * <a href="0420_exp/time_record/no_interference_App_minus_TCP.txt"> no_interference_App_minus_TCP.txt </a>
      * <a href="0420_exp/time_record/2_interference_App_minus_TCP.txt"> 2_interference_App_minus_TCP.txt </a>
      * <a href="0420_exp/time_record/4_interference_App_minus_TCP.txt"> 4_interference_App_minus_TCP.txt </a>

  * Processing:
    * pcap_csv_analysis: Divide each testing round and stage by _tcp sequence number_ and _tcp segment length_. Calculate the latency in the transport layer.
      * <a href="0420_exp/pcap_csv_analysis_no_interference.ipynb"> pcap_csv_analysis_no_interference.ipynb </a>
      * <a href="0420_exp/pcap_csv_analysis_2_interference.ipynb"> pcap_csv_analysis_2_interference.ipynb </a>
      * <a href="0420_exp/pcap_csv_analysis_4_interference.ipynb"> pcap_csv_analysis_4_interference.ipynb </a>
    * <a href="0420_exp/Application_minus_TCP_processing.ipynb"> Application_minus_TCP_processing.ipynb </a>: Calculate the latency difference between the application and the transport layers in three scenarios.

  * Plotting:
    * <a href="0420_exp/latency_plot_App_minus_TCP.ipynb"> latency_plot_App_minus_TCP.ipynb </a>: Plot the latency difference between the application and the transport layers in three scenarios.
    * <a href="0420_exp/latency_plot_TCP_added.ipynb"> latency_plot_TCP_added.ipynb </a>: This is the main plotting program. Plot the application and the transport layers latency in three scenarios, application layer vs. transport layer, each stage latency normalized to timeout value, general latency, and the cdf of each stage.

## Experiment-2
* <a href="0612_exp/"> 0612_exp </a>: Latency experiment including the data link layer and 802.11 AC configurations.
  * <a href="0612_exp/csv/"> 0612_exp/csv/ </a>: 
    * <a href="0612_exp/csv/TCP/"> 0612_exp/csv/TCP/ </a>: Wireshark filtered TCP and UDP packets in csv.
    * <a href="0612_exp/csv/DataLink/"> 0612_exp/csv/DataLink/ </a>: Wireshark filtered Data Link layer packets in csv. Each directory contains _evcc_send.csv_, _secc_send.csv_, and _evcc_blockack.csv_. There might be lost packets in the 802.11 sniffing pcap files. **no_interf_VI and no_interf_VO are not calculated in the data link layer, and not included in the paper.**
      * <a href="0612_exp/csv/DataLink/no_interf/"> 0612_exp/csv/DataLink/no_interf/ </a>
      * <a href="0612_exp/csv/DataLink/max_interf/"> 0612_exp/csv/DataLink/max_interf/ </a>
      * <a href="0612_exp/csv/DataLink/max_interf_VI/"> 0612_exp/csv/DataLink/max_interf_VI/ </a>
      * <a href="0612_exp/csv/DataLink/max_interf_VO/"> 0612_exp/csv/DataLink/max_interf_VO/ </a>

  * <a href="0612_exp/time_record/"> 0612_exp/time_record/ </a>: Result time logs in separate layers.
    * **No Interference**
      * Application layer:
        * <a href="0612_exp/time_record/no_interf_time_record_raw.txt"> no_interf_time_record_raw.txt </a>
      * Transport layer:
        * <a href="0612_exp/time_record/no_evcc_TCP_UDP.txt"> no_evcc_TCP_UDP.txt </a>
      * Data link layer:
        * <a href="0612_exp/time_record/no_interf_80211.txt"> no_interf_80211.txt </a>
    * **Max Interference**
      * Application layer:
        * <a href="0612_exp/time_record/max_interf_time_record_raw.txt"> max_interf_time_record_raw.txt </a>
      * Transport layer:
        * <a href="0612_exp/time_record/max_evcc_TCP_UDP.txt"> max_evcc_TCP_UDP.txt </a>
      * Data link layer:
        * <a href="0612_exp/time_record/max_interf_80211.txt"> max_interf_80211.txt </a>
    * **Max Interference-VI**
      * Application layer:
        * <a href="0612_exp/time_record/max_interf_VI_time_record_raw.txt"> max_interf_VI_time_record_raw.txt </a>
      * Transport layer:
        * <a href="0612_exp/time_record/max_VI_evcc_TCP_UDP.txt"> max_VI_evcc_TCP_UDP.txt </a>
      * Data link layer:
        * <a href="0612_exp/time_record/max_VI_80211.txt"> max_VI_80211.txt </a>
    * **Max Interference-VO**
      * Application layer:
        * <a href="0612_exp/time_record/max_interf_VO_time_record_raw.txt"> max_interf_VO_time_record_raw.txt </a>
      * Transport layer:
        * <a href="0612_exp/time_record/max_evcc_VO_TCP_UDP.txt"> max_evcc_VO_TCP_UDP.txt </a>
      * Data link layer:
        * <a href="0612_exp/time_record/max_VO_80211.txt"> max_VO_80211.txt </a>
    * Not included in the paper:
      * <a href="0612_exp/time_record/no_interf_VI_time_record_raw.txt"> no_interf_VI_time_record_raw.txt </a>
      * <a href="0612_exp/time_record/no_interf_VO_time_record_raw.txt"> no_interf_VO_time_record_raw.txt </a>
      * <a href="0612_exp/time_record/no_VI_evcc_TCP_UDP.txt"> no_VI_evcc_TCP_UDP.txt </a>
      * <a href="0612_exp/time_record/no_VO_evcc_TCP_UDP.txt"> no_VO_evcc_TCP_UDP.txt </a>

  * Processing:
    * Transport layer – pcap_TCP_csv_processing: Divide each testing round and stage by _tcp sequence number_ and _tcp segment length_. Calculate the latency in the transport layer. Generate the time records in the transport layer.
      * <a href="0612_exp/pcap_TCP_csv_processing_no.ipynb"> pcap_TCP_csv_processing_no.ipynb </a>
      * <a href="0612_exp/pcap_TCP_csv_processing_no_VI.ipynb"> pcap_TCP_csv_processing_no_VI.ipynb </a>
      * <a href="0612_exp/pcap_TCP_csv_processing_no_VO.ipynb"> pcap_TCP_csv_processing_no_VO.ipynb </a>
      * <a href="0612_exp/pcap_TCP_csv_processing_max.ipynb"> pcap_TCP_csv_processing_max.ipynb </a>
      * <a href="0612_exp/pcap_TCP_csv_processing_max_VI.ipynb"> pcap_TCP_csv_processing_max_VI.ipynb </a>
      * <a href="0612_exp/pcap_TCP_csv_processing_max_VO.ipynb"> pcap_TCP_csv_processing_max_VO.ipynb </a>
    * Data link layer – pcap_80211_csv_processing:
      * Procedures:
        * Processing _evcc_blockack.csv_, to calculate the time EVCC receives the SECC's response later.
        * Processing _evcc_send.csv_. Use SDP request data length to divide each testing round. Use 802.11 packet data length and packet information to divide each stage. Calculate the time EVCC sends the request packet.
        * Processing _secc_send.csv_. Use SDP response data length to divide each testing round. Use 802.11 packet data length and packet information to divide each stage. Combine with _evcc_blockack.csv_ to calculate the time EVCC receives the response packet.
        * There might be lost packets in the 802.11 sniffing pcap files. Manually add the time back according to the captured pcap files. If there are lost packets in _secc_send.csv_ or _evcc_blockack.csv_, use average block ack latency to calculate.
      * <a href="0612_exp/pcap_80211_csv_processing_no.ipynb"> pcap_80211_csv_processing_no.ipynb </a>
      * <a href="0612_exp/pcap_80211_csv_processing_max.ipynb"> pcap_80211_csv_processing_max.ipynb </a>
      * <a href="0612_exp/pcap_80211_csv_processing_max_VI.ipynb"> pcap_80211_csv_processing_max_VI.ipynb </a>
      * <a href="0612_exp/pcap_80211_csv_processing_max_VO.ipynb"> pcap_80211_csv_processing_max_VO.ipynb </a>
      * <a href="0612_exp/retry_retransmission_80211_counting.ipynb"> retry_retransmission_80211_counting.ipynb </a>: 802.11 retry rate counting. No explicit difference. Not included in the paper.
  * Plotting:
    * <a href="0612_exp/latency_plot_80211_TCP_App.ipynb"> latency_plot_80211_TCP_App.ipynb </a>: This is the main plotting program of the experiment-2. Plot the round trip latency in the application, transport, and data link layers. Also plot the latency difference in separate layers in each scenario, and the general latency comparison.

## Packet Loss Rate Calculation
* Preprocessing:
  * <a href="packetloss_calc/dump_data.sh"> dump_data.sh </a>: Execution procedures are as the followings.
    * Save the pcap files of EVCC and SECC as _evcc.pcapng_ and _secc.pcapng_ **in the same directory**. These are the inputs of the shell script.
    * Save the MAC addresses of EVCC and SECC in <a href="packetloss_calc/evccMAC.txt"> **evccMAC.txt** </a> and <a href="packetloss_calc/seccMAC.txt"> **seccMAC.txt** </a>. The shell script automatically reads the txt files, and uses the MAC addresses and other filters to filter the traffic.
    * The result is saved in the <a href="packetloss_calc/csv/"> **csv/** </a> directory as **evcc_send.csv**, **evcc_receive.csv**, **secc_send.csv**, and **secc_receive.csv**.
* Processing:
* <a href="packetloss_calc/"> packetloss_calc </a>: Calculate packet loss rate of the 0420 and 0612 experiments.

## Others
* <a href="0429_exp/"> 0429_exp </a>: Latency experiment including the data link layer, not included in the paper.
* <a href="0527_exp/"> 0527_exp </a>: Latency experiment including the data link layer and TOTOLINK N300RT QoS setting, not included in the paper.
