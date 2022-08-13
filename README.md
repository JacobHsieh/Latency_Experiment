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
    * <a href="0420_exp/csv/4_interfere_evcc_UDP_TCP.csv"> 4_interfere_evcc_UDP_TCP.csv </a
  * 


* <a href="0612_exp/"> 0612_exp </a>: Latency experiment including the data link layer and 802.11 AC configurations.
