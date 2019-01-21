#!/usr/bin/env bash

hostnamectl set-hostname $1
echo 127.0.0.1 $1 >> /etc/hosts
apt-get update
apt-get remove docker docker-engine docker.io containerd runc
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
sudo apt-get install docker-ce  -y

#sudo docker swarm join --token SWMTKN-1-5atv8ik0r0mjkiqa9eeayi35c37drze8hmnslbej84iapqdmvp-anhoj6a9v2qon7xalpv9x47lw 192.168.10.123:2377