sudo apt-get update

# Install Docker
sudo apt install curl -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install docker-ce -y
sudo gpasswd -a $USER docker

# Install Docker-Compose
DOCKER_COMPOSE=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Misc Docker
mkdir ~/docker
cd ~/docker
echo "alias dpwd='docker run -it -v /mnt/hgfs:/pwd pantools'" >> ~/.bash_aliases
echo "alias pswb='docker run -it -v /mnt/hgfs:/pwd pantools'" >> ~/.bash_aliases
echo "alias dc='docker-compose'" >> ~/.bash_aliases
source ~/.bash_aliases

sudo apt-get install traceroute
sudo apt-get install tree


# ifconfig ~1MB
sudo apt-get install net-tools

# TCPDump ~3MB
sudo apt-get install tcpdump -y

# Telnet ~1MB ... useful for port testing :)
sudo apt-get install telnet

# NSLookup ~45MB
sudo apt-get install dnsutils -y

# sha256sum and md5sum ~1MB
sudo apt-get install hashalot

# My Trace Route ~28MB
sudo apt-get install mtr -y

# Speedtest ~1MB
sudo pip install speedtest-cli

# todos and fromdos to convert LF to CR/LF for Windows/Linux/Mac text compatibility ~2MB
sudo apt-get install tofrodos

# Hping3 ~5MB
# Examples: http://0daysecurity.com/articles/hping3_examples.html
# Note: Docker seems to rate/limit/drop flood commands
# ENV fixes prompting in Ubuntu 18.04
ENV DEBIAN_FRONTEND=noninteractive
sudo apt-get install hping3 -y

# Lynx Web Browser ~8MB
sudo apt-get install lynx -y

# Slurm Network Usage ~1MB
# Example: slurm -i eth0
sudo apt-get install slurm -y

# NMon System Monitor ~2MB
sudo apt-get install nmon -y

# Disk Monitor ~3MB
# Example: Disk Queue size: iostat -x
sudo apt-get install sysstat -y

# Midnight Commander mc ~10MB
sudo apt-get install mc -y


# Install latest Ubuntu patches
sudo apt upgrade -y

# Resolve problem with some processes hanging on boot
sudo systemctl disable systemd-networkd-wait-online.service
sudo systemctl mask systemd-networkd-wait-online.service

sudo reboot
