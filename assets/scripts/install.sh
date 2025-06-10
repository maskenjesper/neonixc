#!/bin/sh

# Automated script to install my nix configuration.

echo "Installing nix config..."

echo "Entering nix shell"
nix-shell -p git

echo "Cloning repo..."
git clone https://github.com/maskenjesper/neonixc.git ~/testnixc


