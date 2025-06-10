#!/bin/sh

# Automated script to install my nix configuration.
if [ $# -gt 0 ]
  then
    HOST_NAME=$1
  else
    echo "Invalid arguments"
    exit 1
fi
if [ $# -gt 1 ]
  then
    USER_NAME=$2
  else
    echo "Invalid arguments"
    exit 1
fi

sudo echo "Installing nix config for host ${HOST_NAME} with user ${USER_NAME}..."

echo "Cloning repo..."
git clone https://github.com/maskenjesper/neonixc.git

pushd "./neonixc" || exit

# TODO If host and/or username doesn't exist already. Create a new template profile.



# nix requires all files in the directory to be either commited or staged
git add --all
echo ====================== Running nixos-rebuild ======================
sudo nixos-rebuild switch --impure --flake ".#${HOST_NAME}" --show-trace -L -v 

if [[ $? -eq 0 ]]; then
    echo ====================== Running home-manager ======================
    home-manager switch --experimental-features 'nix-command flakes' --impure --flake ".#${USER_NAME}@${HOST_NAME}" -b backup --show-trace -L -v
    
    if [[ $? -eq 0 ]]; then
        echo Sync successful 
    else
        echo Home manager failed. Aborting...
    fi
else
    echo Rebuild failed. Aborting...    
fi

popd || exit

sudo mv ./neonixc /home/${USER_NAME}/neonixc




