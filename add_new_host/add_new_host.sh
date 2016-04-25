#!/bin/bash
#script to add new host to ansible 
#get vars
echo "Please enter SSH username: "
read USER_NAME
echo "You entered: $USER_NAME"

echo "Please enter Remoute hostname with out .tdmu.local: "
read HOST_NAME
echo "You entered: $HOST_NAME"

echo "Please enter server last octed of ip (with out :10.1.1. "
read HOST_IP
echo "You entered: 10.1.1.$HOST_IP"

read -p "ssh port number [22]: " port
port=${port:-22}
echo -e "[NEW_HOSTS]\n10.1.1.$HOST_IP:$port  " > new_host
#push key to the host
ansible-playbook add_key.yml  -u $USER_NAME -i new_host -k -K

read -p "add host to dns y/N: " add_to_dns
add_to_dns=${add_to_dns:-N}
            if [ "$add_to_dns" = "y" ]; then
              ansible-playbook add_dns.yml -e hostname=$HOST_NAME  -e serverip=$HOST_IP
            fi
read -p "add host to ansible y/N: " add_to_ansible
add_to_ansible=${add_to_ansible:-N}
            if [ "$add_to_ansible" = "y" ]; then
              ansible-playbook add_to_ansible.yml -e hostname=$HOST_NAME
            fi
read -p "update hostnames y/N: " add_hostnames
add_hostnames=${add_hostnames:-N}
            if [ "$add_hostnames" = "y" ]; then
              ansible-playbook add_hostnames.yml -i new_host -e hostname=$HOST_NAME  -e serverip=$HOST_IP
            fi





