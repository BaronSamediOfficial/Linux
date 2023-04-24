#!/bin/bash

# script to run though common nmap scans for initial recon from an networked jump box.
# -sC = Scripts ,-sV = Versions , -sU = UDP , -sX = Xmas Tree
#
#
#
targetSite=$1
sudo nmap --script "vuln and safe" -oN nmap_Vuln+Safe.txt $targetSite
sudo nmap -T4 -A -p- -oN nmap_-A_-p-_-T4.txt $targetSite
sudo nmap -T5 -sS -p- -oN nmap_SYN_Stealth_-p-.txt $targetSite
sudo nmap -T4 -sC -sV -p- -oN nmap_Scripts+Versions_-p-_-T4.txt $targetSite
sudo nmap -T5 -sU -p- -oN nmap_UDP_-p-.txt $targetSite
sudo nmap -T4 -sX -p- -oN nmap_FIN+PSH+URG_-p-_-T4.txt $targetSite
