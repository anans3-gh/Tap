#!/bin/bash

echo -e "\e[0;34mThis simple bash script will setup a tap interface for you"
echo "It will create a tap interface called tap0 and bridge that to an interface of your choice"
echo ""
sleep 1
echo "Please enter the interface you would like to bridge to"
read interface
sleep 1
echo ""
echo -e "\e[1;32mBuilding bridge....please wait"
sleep 1
tunctl -u $(whoami) -t tap0
ifconfig tap0 0.0.0.0 promisc up
ifconfig $interface 0.0.0.0 promisc up
brctl addbr br0
brctl addif br0 tap0
brctl addif br0 $interface
echo ""
echo -e "\e[1;32mBringing bridge interface up...."
sleep 1
ifconfig br0 up
echo ""
echo -e "\e[0;34mWhat IP address do you want to assign the bridged interface? e.g (10.10.10.1)"
read ipaddress
echo -e "\e[0;34mWhat IP subnet mask do you want to assign the bridged interface? e.g (255.255.255.0)"
read subnetmask
echo ""
echo "Assigning IP address..."
sleep 1
ifconfig br0 $ipaddress netmask $subnetmask
echo ""
echo -e "\e[1;32mDone"
echo "A tap interface has been created with the following details"
echo Tap Interface : tap0
echo IP Address  :  $ipaddress
echo NetMask     :  $subnetmask

