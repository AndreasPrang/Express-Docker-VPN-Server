#!/bin/bash

# install docker on debian jessie if needed
exists()
{
  command -v "$1" >/dev/null 2>&1
}

if exists docker; then
    docker -v
else
    echo "Installing Docker"
    sudo apt-get -y install      apt-transport-https      ca-certificates      curl      software-properties-common
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
	sudo apt-get update
	sudo apt-get -y install docker-ce
	clear
	docker -v 
fi


# set credentials
echo -n User: 
read VPN_USER
echo -n Password: 
read VPN_PASSWORD
echo -n IPSEC PSK: 
read VPN_IPSEC_PSK
echo
echo

touch /tmp/vpn.env
echo "VPN_USER=$VPN_USER" > /tmp/vpn.env
echo "VPN_PASSWORD=$VPN_PASSWORD" >> /tmp/vpn.env
echo "VPN_IPSEC_PSK=$VPN_IPSEC_PSK" >> /tmp/vpn.env


sudo modprobe af_key

# get Docker Image
docker pull hwdsl2/ipsec-vpn-server

# start container
docker run \
    --name ipsec-vpn-server \
    --env-file /tmp/vpn.env \
    --restart=always \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    hwdsl2/ipsec-vpn-server
    
    
    
