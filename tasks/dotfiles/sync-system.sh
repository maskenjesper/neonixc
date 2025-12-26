#!/usr/bin/env bash

sudo echo starting

pushd ~/neonixc/ || exit

# nix requires all files in the directory to be either commited or staged
git add --all

echo ====================== Running nixos-rebuild ======================
# sudo nixos-rebuild switch --impure --flake . --show-trace -L -v
nh os switch ~/neonixc

if [[ $? -eq 0 ]]; then
    echo Sync successful
else
    echo Rebuild failed. Aborting...
fi

popd || exit
