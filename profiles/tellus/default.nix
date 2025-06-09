{ pkgs, ... }: { 
  imports = [
    ./hardware-configuration.nix 

    ../../system/common
    ../../system/desktop-environments/hyprland
    ../../system/apps/_1password
    ../../system/features/adb
    ../../system/features/gaming 
    ../../system/features/virtualization
    ../../system/hardware/nvidia
    ../../system/hardware/keyboard/keymap
    ../../system/hardware/keyboard/xremap
  ];

  networking.hostName = "tellus"; # Define your hostname.

  users.users.jakob = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "Jakob Olsson";
    extraGroups = ["networkmanager" "wheel"];
    packages = [
      pkgs.home-manager
    ];
  };
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    # Avoid adding packages here.
  ];

  system.stateVersion = "24.05";
}
