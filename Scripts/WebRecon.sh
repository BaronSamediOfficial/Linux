#!/bin/bash
# script to run through common nmap scans for initial recon from a networked jump box.
# -sC = Scripts, -sV = Versions, -sU = UDP, -sX = Xmas Tree
#
targetSite=$1

if [[ -z "$targetSite" ]]; then
    echo "Error: No target site specified."
    exit 1
fi

sudo nmap --script "vuln and safe" -oN nmap_Vuln+Safe.txt $targetSite
sudo nmap -T4 -A -p- -oN nmap_-A_-p-_-T4.txt $targetSite
sudo nmap -T5 -sS -p- -oN nmap_SYN_Stealth_-p-.txt $targetSite
sudo nmap -T4 -sC -sV -p- -oN nmap_Scripts+Versions_-p-_-T4.txt $targetSite
sudo nmap -T5 -sU -p- -oN nmap_UDP_-p-.txt $targetSite
sudo nmap -T4 -sX -p- -oN nmap_FIN+PSH+URG_-p-_-T4.txt $targetSite


if [[ $# -eq 0 ]] ; then
    echo 'No Target entered. Domain name required eg : google.com '
    exit 0
fi

export TARGET=$1
export PORT="443"


echo "PINGING Target $TARGET............................................................."
echo
# ping -c 2 $TARGET 

echo
echo "Looking up short records of $TARGET with dig ............................................................."
echo
# dig +short $TARGET

# # nslookup $TARGET
echo
echo "Looking up A records of $TARGET ............................................................."
echo
# nslookup -query=A "$TARGET"
echo

# dig a "$TARGET"

# # PTR ( POinter records. )
echo
echo "Looking up PTR records of $TARGET ............................................................."
echo
# nslookup -query=PTR "$TARGET"

# # nslookup $TARGET
# # The more recent RFC8482 specified that ANY DNS requests be abolished. Therefore, we may not receive a response to our ANY request from the DNS server or get a reference to the said RFC8482.
echo
echo "nslookup ANY records of $TARGET ............................................................."
echo
# nslookup -query=ANY "$TARGET"
echo

echo
echo "Dig ANY records of $TARGET ............................................................."
echo
# dig any +short "$TARGET"
echo

# # TXT records
echo
echo "Looking up TXT records of $TARGET ............................................................."
echo
# nslookup -query=TXT "$TARGET"
echo

# # MX records
echo
echo "Looking up MX records of $TARGET ............................................................."
echo
# nslookup -query=MX "$TARGET"
echo

# # MX records
echo
echo "Looking up NS records of $TARGET ............................................................."
echo
# nslookup -query=NS "$TARGET"
echo

# # Zone Transfrer
echo "Trying Zone Transfer of $TARGET ............................................................."
echo
# domain="$TARGET"
# ns=$(dig +noall +answer NS $domain | awk '{print $5}')
# for server in $ns
# do
#   dig @$server AXFR $domain
# done

# ---------- Passive subdomain enumberation

echo
echo "Passive subdomain enumeration on $TARGET via https://crt.sh ............................................................."
echo
# curl -s "https://crt.sh/?q=${TARGET}&output=json" | jq -r '.[] | "\(.name_value)\n\(.common_name)"' | sort -u > '${TARGET}_crt.sh.txt'

# openssl s_client -ign_eof 2>/dev/null <<<$'HEAD / HTTP/1.0\r\n\r\' -connect $TARGET:$PORT | openssl x509 -noout -text | grep "DNS" | sed -e "s|DNS:|\n|g" -e 's|^\*.*||g' | tr -d ',' | sort -u

echo DONE


# List of Intelligence gathering sites for The Harvester tool
echo """
baidu
bufferoverun
crtsh
hackertarget
otx
projecdiscovery
rapiddns
sublist3r
threatcrowd
trello
urlscan
vhost
virustotal
zoomeye
""" >> new.txt

cat new.txt | while read source; do theHarvester -d "${TARGET}" -b $source -f "${source}_${TARGET}";done

# #cat sources.txt | while read source; do theHarvester -d "${TARGET}" -b $source -f "${source}_${TARGET}";done

cat *.json | jq -r '.hosts[]' 2>/dev/null | cut -d':' -f 1 | sort -u > "${TARGET}_theHarvester-REPORT.txt"

