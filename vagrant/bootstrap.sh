#!/usr/bin/env bash
# Install recommended extra packages
apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

# Allow apt to use repo over HTTPS
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the stable repo
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

# Update the packages
apt-get update

# Install docker-ce
apt-get install -y docker-ce

# Access docker w/o sudo
usermod -aG docker vagrant

apt-get install -y docker-compose

# test -f /usr/local/bin/docker-compose && exit

# output='docker-compose'
# sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` > ./$output
# chmod +x $output
# mv docker-compose /usr/local/bin/docker-compose
# chown root:root /usr/local/bin/docker-compose
