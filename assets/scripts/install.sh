#!/bin/sh

# Automated script to install my nix configuration.

# Parse arguments
if [ $# -gt 1 ] then
    HOSTNAME=$1
    USERNAME=$2
else
    echo "Invalid arguments"
fi


echo "Installing nix config..."

echo "Entering nix shell"
nix-shell -p git

echo "Cloning repo..."
git clone https://github.com/maskenjesper/neonixc.git ~/neonixc


