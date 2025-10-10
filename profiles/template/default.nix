{ pkgs, ... }: { 
  imports = [
    ./hardware-configuration.nix 

    ../../system/common
    ../../system/hardware/keyboard/keymap
    ../../system/hardware/keyboard/xremap
  ];

  networking.hostName = "hostname"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    # Avoid adding packages here.
  ];

  system.stateVersion = "24.05";
}
