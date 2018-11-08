#!/bin/sh

export LC_ALL=C
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -y docker-engine python3-pip
sudo service docker start
#sudo usermod -aG docker $(shell users)
sudo pip3 install docker-compose
