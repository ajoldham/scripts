#!/bin/bash
# Works on Azure/Ubuntu 16.04

# To run... or Copy/Paste :)
# wget https://github.com/ajoldham/scripts/blob/master/ubuntu-setup.sh
# chmod +x ubuntu-setup.sh
# ./ubuntu-setup.sh

# Install Docker
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y
sudo apt-get install docker-compose -y
sudo gpasswd -a $USER docker
mkdir ~/docker
cd ~/docker
git clone https://github.com/ajoldham/pantools
echo "alias dpwd='docker run -it -v `pwd`:/pwd pantools'" >> ~/.bash_aliases
echo "alias dc='docker-compose'" >> ~/.bash_aliases
source ~/.bash_aliases

sudo apt-get install traceroute


# Allow SSH for Ubuntu Desktop
# sudo apt-get install openssh-server
# sudo service ssh start

