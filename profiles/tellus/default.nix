{
  pkgs, 
  inputs,
  outputs,
  config,
  lib,
  ...
}: { 
  imports = [
    ./hardware-configuration.nix 

    ../../system/common
    ../../system/users/jakob
    ../../system/apps/_1password
    ../../system/adb
    ../../system/hyprland
    ../../system/gaming 
    ../../system/stylix
    ../../system/hardware/bluetooth
    ../../system/hardware/nvidia
    ../../system/hardware/audio
    ../../system/hardware/keyboard/keymap
    ../../system/hardware/keyboard/xremap
    ../../system/hardware/printing
  ];

  networking.hostName = "tellus"; # Define your hostname.

  ####### define options values here ########
  ###########################################

  swapDevices = lib.mkForce [ ];


  boot.kernelModules = ["v4l2loopback"];
  services.hardware.bolt.enable = true;
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [

    appimage-run
    devenv
    nix-index
    vncdo
    libsForQt5.qt5ct
    ripgrep
    zoxide
    fzf

  ];

  system.stateVersion = "24.05";
}
