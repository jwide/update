#!/bin/sh

#
# Output usage messsage.
#

if [ "$#" -ne 10 ]; then
    echo " "
    echo " Illegal number of parameters"
    echo " "
    echo " "
    echo " Usage: updateips2.sh mgmtnet mgmtnet-cidr wanip2-alias-vip wanip3-alias-vip ovpntunnet ovpntunnet-cidr ovpnlocnet ovpnlocnet-cidr"
    echo " "
    echo " For Example: "
    echo " "
    echo " If the IPs, subnet cidr and gw ips are:"
    echo " MGMT SUBNET RANGE: 192.168.0.64"
    echo " MGMT SUBNET CIDR: /26"
    echo " WANIP2 Alias and Virtual IP: 192.168.0.9"
    echo " WANIP3 Alias and Virtual IP: 192.168.0.11"
    echo " OVPN TUNNEL NETWORK: 172.31.168.0"
    echo " OVPN TUNNEL NETWORK CIDR: 24"
    echo " OVPN LOCAL NETWORK: 192.168.0.0"
    echo " OVPN LOCAL NETWORK CIDR: 24"
    echo " "
    echo " Then the script would be run as: "
    echo " "
    echo " /bin/sh updateips2.sh 192.168.0.64 26 192.168.0.9 192.168.0.11 172.31.168.0 24 192.168.0.0 24"
    echo " "
    exit 1
else

sed -i '' -E -e 's/10.10.10.10/'$1'/g' config.xml
sed -i '' -E -e 's/11.11.11.11/'$2'/g' config.xml
sed -i '' -E -e 's/12.12.12.12/'$3'/g' config.xml
sed -i '' -E -e 's/13.13.13.13/'$4'/g' config.xml
sed -i '' -E -e 's/14.14.14.14/'$5'/g' config.xml
sed -i '' -E -e 's/15.15.15.15/'$6'/g' config.xml
sed -i '' -E -e 's/16.16.16.16/'$7'/g' config.xml
sed -i '' -E -e 's/17.17.17.17/'$8'/g' config.xml

fi
