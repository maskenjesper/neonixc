{ ... }: { 
  imports = [
    ./hardware-configuration.nix 

    ../../system/common
    ../../system/users/jakob
    ../../system/desktop-environments/hyprland
    ../../system/apps/_1password
    ../../system/adb
    ../../system/gaming 
    ../../system/hardware/bluetooth
    ../../system/hardware/nvidia
    ../../system/hardware/audio
    ../../system/hardware/keyboard/keymap
    ../../system/hardware/keyboard/xremap
    ../../system/hardware/printing
  ];

  networking.hostName = "tellus"; # Define your hostname.

  system.stateVersion = "24.05";
}
