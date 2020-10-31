#!/bin/bash

echo -e "\e[0;34mThis simple bash script will setup a tap interface for testing"
sleep 1
echo ""
echo -e "\e[0;34mWhat tap interface do you want to assign? e.g (tap0)"
read tap
echo ""
echo -e "\e[1;32mCreating tap interface....please wait...."
sleep 1
tunctl -u $(whoami) -t $tap
ifconfig $tap 0.0.0.0 promisc up
echo ""
echo -e "\e[0;34mWhat IP address do you want to assign the tap interface? e.g (10.10.10.1)"
read ipaddress
echo -e "\e[0;34mWhat IP subnet mask do you want to assign the tap interface? e.g (255.255.255.0)"
read subnetmask
echo ""
echo "Assigning IP address..."
sleep 1
ifconfig $tap $ipaddress netmask $subnetmask
ifup $tap
echo ""
echo -e "\e[1;32mDone"
echo "A tap interface has been created with the following details"
echo Tap Interface : $tap
echo IP Address  :  $ipaddress
echo NetMask     :  $subnetmask

