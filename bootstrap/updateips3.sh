#!/bin/sh

#
# Output usage messsage.
#

if [ "$#" -ne 6 ]; then
    echo " "
    echo " Illegal number of parameters"
    echo " "
    echo " "
    echo " Usage: updateips3.sh gatewaynet gatewaynet-cidr azurep2snet azurep2snet-cidr fwpw oxipw"
    echo " "
    echo " For Example: "
    echo " "
    echo " If the IPs, subnet cidr and gw ips are:"
    echo " GATEWAY SUBNET RANGE: 192.168.0.128"
    echo " GATEWAY SUBNET CIDR: /26"
    echo " AZURE P2S NETWORK RANGE: 172.16.0.0"
    echo " AZURE P2S NETWORK CIDR: /24"
    echo " FWPW: opnsense "
    echo " OXIDIZED PW: oxidized "
    echo " "
    echo " Then the script would be run as: "
    echo " "
    echo " /bin/sh updateips3.sh 192.168.0.128 26 opnsense oxidized"
    echo " "
    exit 1
else

FWPW=`php pw.php $5`

#echo "The password is: $5"
#echo "The password hash is: $FWPW"

OXIPW=`php pw.php $6`

#echo "The password is: $6"
#echo "The password hash is: $OXIPW"

sed -i '' -E -e 's/18.18.18.18/'$1'/g' config.xml
sed -i '' -E -e 's/19.19.19.19/'$2'/g' config.xml
sed -i '' -E -e 's/20.20.20.20/'$3'/g' config.xml
sed -i '' -E -e 's/21.21.21.21/'$4'/g' config.xml
sed -i '' -E -e 's|22.22.22.22|'$FWPW'|g' config.xml
sed -i '' -E -e 's|23.23.23.23|'$OXIPW'|g' config.xml

fi
