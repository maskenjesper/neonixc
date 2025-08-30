#!/usr/bin/env bash

sudo echo starting

pushd ~/neonixc/ || exit

# nix requires all files in the directory to be either commited or staged
git add --all

echo ====================== Running home-manager ======================
home-manager switch --impure --flake . -b backup --show-trace -L -v

if [[ $? -eq 0 ]]; then
    echo ====================== Running nixos-rebuild ======================
    sudo nixos-rebuild switch --impure --flake . --show-trace -L -v 
    
    if [[ $? -eq 0 ]]; then
        echo Sync successful 
        gen=$(nixos-rebuild list-generations | awk '$NF == "True" { print $2, $3 }')
        git commit -m "$gen"
    else
        echo Rebuild failed. Aborting...    
    fi
else
    echo Home manager failed. Aborting...
fi

popd || exit
