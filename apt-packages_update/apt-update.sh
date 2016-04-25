#!/bin/bash
#script to add new host to ansible
#get vars
echo "Please enter Remoute hostname without .tdmu.local: "
read HOST_NAME
echo "You entered: $HOST_NAME"

ansible-playbook apt-update.yml  -e hostname="$HOST_NAME.tdmu.local"







