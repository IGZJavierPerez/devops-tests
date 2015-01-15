#!/usr/bin/env bash

echo "##########Installing necessary dependencies ...##########"
apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y git

echo "##########Installing Node ...##########"
cd /tmp
wget http://nodejs.org/dist/v0.10.35/node-v0.10.35.tar.gz
tar xvf node-v0.10.35.tar.gz
cd node-v0.10.35
./configure
make
make install
echo "##########Testing node is installed##########"
node -v

echo "##########Installing MongoDB ...##########"
cd /opt
wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.6.7.tgz
tar xvf mongodb-linux-x86_64-2.6.7.tgz
mongodb-linux-x86_64-2.6.7/bin
sudo sh -c 'echo PATH=\$PATH:/opt/mongodb-linux-x86_64-2.6.7/bin > /etc/profile'
source /etc/profile
mkdir -p /data/db

echo "##########Starting MongoDB ...##########"
nohup /opt/mongodb-linux-x86_64-2.6.7/bin/mongod &

echo "##########Installing Redis ...##########"
cd /tmp
wget wget http://download.redis.io/releases/redis-2.8.19.tar.gz
tar xvf redis-2.8.19.tar.gz
cd redis-2.8.19
make
make install

echo "##########Starting Redis ...##########"
nohup redis-server &

echo "##########Installing npm dependencies ...##########"
cd /vagrant
npm install

echo "##########Starting Eagle Ninja server ...##########"
nohup npm run-script local-server &
