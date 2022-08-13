# ISO-15118 Latency Experiment
This is the ISO 15118 wireless communication latency experiment. The objective is to
1. Analyze the impact on wireless communication latency by interference or coexistence.
2. Reduce the probability of timeout occurrence.

## Table of Contents
* [File Description](#file-description)

## File Description
* <a href="0420_exp/"> 0420_exp </a>: Latency experiment above the transport layer.
  * <a href="0420_exp/csv/"> 0420_exp/csv/ </a>: Wireshark filtered TCP and UDP packet in csv in three scenarios.
    * <a href="0420_exp/csv/no_interfere_evcc_UDP_TCP.csv"> no_interfere_evcc_UDP_TCP.csv </a>
    * <a href="0420_exp/csv/2_interfere_evcc_UDP_TCP.csv"> 2_interfere_evcc_UDP_TCP.csv </a>
    * <a href="0420_exp/csv/4_interfere_evcc_UDP_TCP.csv"> 4_interfere_evcc_UDP_TCP.csv </a>
    * 
  * <a href="0420_exp/time_record/"> 0420_exp/time_record/ </a>: Result time logs in separate layers. Each row represents a testing round, and normally, there will be 20 testing rounds (rows) if no timeout occurs. Column 0 to column 9 represent specific stages, and column 10 and column 11 represent general stages. Detail definition of stages please refer to the paper. It is worth noting that column 10 = column 0 + column 1, and column 11 = sum of column 0 to column 9.


* <a href="0612_exp/"> 0612_exp </a>: Latency experiment including the data link layer and 802.11 AC configurations.
