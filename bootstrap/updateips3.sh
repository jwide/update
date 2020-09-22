#!/bin/sh

#
# Output usage messsage.
#

if [ "$#" -ne 2 ]; then
    echo " "
    echo " Illegal number of parameters"
    echo " "
    echo " "
    echo " Usage: updateips3.sh gatewaynet gatewaynet-cidr"
    echo " "
    echo " For Example: "
    echo " "
    echo " If the IPs, subnet cidr and gw ips are:"
    echo " GATEWAY SUBNET RANGE: 192.168.0.128"
    echo " GATEWAY SUBNET CIDR: /26"
    echo " "
    echo " Then the script would be run as: "
    echo " "
    echo " /bin/sh updateips3.sh 192.168.0.128 26"
    echo " "
    exit 1
else

sed -i '' -E -e 's/18.18.18.18/'$1'/g' config.xml
sed -i '' -E -e 's/19.19.19.19/'$2'/g' config.xml

fi
