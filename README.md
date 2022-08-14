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
    * Application layer:
    * Transport layer:
    * Data link layer:

## Packet Loss Rate Calculation
* <a href="packetloss_calc/"> packetloss_calc </a>: Calculate packet loss rate of the 0420 and 0612 experiments.

## Others
* <a href="0429_exp/"> 0429_exp </a>: Latency experiment including the data link layer, not included in the paper.
* <a href="0527_exp/"> 0527_exp </a>: Latency experiment including the data link layer and TOTOLINK N300RT QoS setting, not included in the paper.
