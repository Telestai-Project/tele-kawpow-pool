#!/bin/sh

# This is the Pool install script.
echo "Pool install script."
echo "Please do NOT run as root, run as the pool user!"

echo "Installing... Please wait!"

sleep 3

sudo add-apt-repository -y ppa:bitcoin/bitcoin

sudo apt update
sudo apt upgrade -y

sudo apt-get install -y sudo git nano wget curl ntp build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev git npm nodejs nodejs-legacy libminiupnpc-dev redis-server software-properties-common fail2ban libdb4.8-dev libdb4.8++-dev

sudo systemctl enable fail2ban
sudo systemctl start fail2ban

sudo systemctl enable redis-server
sudo systemctl start redis-server

sudo systemctl enable ntp
sudo systemctl start ntp

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.bashrc

nvm install v8.1.4
nvm use v8.1.4
sudo npm update -g

sudo npm install -g pm2@latest
sudo npm install -g npm@latest

sudo npm install
sudo npm update
sudo npm audit fix
sudo npm install sha3

#./start-pool.sh


echo "Installation completed!"

exit 0