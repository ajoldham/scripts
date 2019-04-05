#!/bin/bash
# Works on Azure/Ubuntu 16.04

# To run... or Copy/Paste :)
# wget https://raw.githubusercontent.com/ajoldham/scripts/master/ubuntu-setup.sh
# bash ubuntu-setup.sh

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

# ifconfig ~1MB
sudo apt-get install net-tools

# TCPDump ~3MB
sudo apt-get install tcpdump -y

# Telnet ~1MB ... useful for port testing :)
sudo apt-get install telnet

# NSLookup ~45MB
sudo apt-get install dnsutils -y

# Samba
sudo apt-get install samba
sudo smbpasswd -a $USER
sudo bash -c 'echo "[ALL]" >> /etc/samba/smb.conf'
sudo bash -c 'echo "path = /" >> /etc/samba/smb.conf'
# Check valid users is not root (from sudo)
USERNAME=$USER
sudo bash -c 'echo "valid users = $USERNAME" >> /etc/samba/smb.conf'
sudo bash -c 'echo "read only = no" >> /etc/samba/smb.conf'
sudo service smb




# Allow SSH for Ubuntu Desktop
# sudo apt-get install openssh-server
# sudo service ssh start

