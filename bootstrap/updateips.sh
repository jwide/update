#!/bin/sh

#
# Output usage messsage.
#

if [ "$#" -ne 10 ]; then
    echo " "
    echo " Illegal number of parameters"
    echo " "
    echo " "
    echo " Usage: updateips.sh wanip wansubnet-cidr lanip lansubnet-cidr langw-ip wangw-ip network-addr-range network-cidr"
    echo " "
    echo " For Example: "
    echo " "
    echo " If the IPs, subnet cidr and gw ips are:"
    echo " WAN IP: 192.168.0.7"
    echo " WAN SUBNET CIDR: /24"
    echo " LAN IP: 192.168.4.7"
    echo " LAN SUBNET CIDR: /24"
    echo " LAN GW IP: 192.168.4.1"
    echo " WAN GW IP: 192.168.0.1"
    echo " BACKEND SUBNET RANGE: 192.168.0.0"
    echo " BACKEND SUBNET CIDR: /24"
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
    echo " /bin/sh updateips.sh 192.168.0.7 24 192.168.4.7 24 192.168.4.1 192.168.0.1 192.168.0.0 24 192.168.0.64 26 192.168.0.9 192.168.0.11 172.31.168.0 24 192.168.0.0 24"
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
sed -i '' -E -e 's/10.10.10.10/'$9'/g' config.xml
sed -i '' -E -e 's/11.11.11.11/'$10'/g' config.xml
sed -i '' -E -e 's/12.12.12.12/'$11'/g' config.xml
sed -i '' -E -e 's/13.13.13.13/'$12'/g' config.xml
sed -i '' -E -e 's/14.14.14.14/'$13'/g' config.xml
sed -i '' -E -e 's/15.15.15.15/'$14'/g' config.xml
sed -i '' -E -e 's/16.16.16.16/'$15'/g' config.xml
sed -i '' -E -e 's/17.17.17.17/'$16'/g' config.xml

fi
