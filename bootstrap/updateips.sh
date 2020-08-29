#!/bin/sh

#
# Output usage messsage.
#

if [ "$#" -ne 8 ]; then
    echo " "
    echo " Illegal number of parameters"
    echo " "
    echo " "
    echo " Usage: updateips.sh wanip wansubnet-cidr lanip lansubnet-cidr langw-ip wangw-ip backendnetw backendnet-cidr"
    echo " "
    echo " For Example: "
    echo " "
    echo " If the IPs, subnet cidr and gw ips are:"
    echo " WAN IP: 192.168.0.7"
    echo " WAN SUBNET CIDR: /27"
    echo " LAN IP: 192.168.0.39"
    echo " LAN SUBNET CIDR: /27"
    echo " LAN GW IP: 192.168.4.1"
    echo " WAN GW IP: 192.168.0.1"
    echo " BACKEND SUBNET RANGE: 192.168.0.32"
    echo " BACKEND SUBNET CIDR: /27"
    echo " "
    echo " Then the script would be run as: "
    echo " "
    echo " /bin/sh updateips.sh 192.168.0.7 27 192.168.0.39 27 192.168.0.33 192.168.0.1 192.168.0.32 27"
    echo " "
    exit 1
else

sed -i '' -E -e 's/1.1.1.1/'$1'/g' config.xml
sed -i '' -E -e 's/2.2.2.2/'$2'/g' config.xml
sed -i '' -E -e 's/3.3.3.3/'$3'/g' config.xml
sed -i '' -E -e 's/4.4.4.4/'$4'/g' config.xml
sed -i '' -E -e 's/5.5.5.5/'$5'/g' config.xml
sed -i '' -E -e 's/6.6.6.6/'$6'/g' config.xml
sed -i '' -E -e 's/7.7.7.7/'$7'/g' config.xml
sed -i '' -E -e 's/9.9.9.9/'$8'/g' config.xml

fi
