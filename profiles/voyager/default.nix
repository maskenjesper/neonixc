{ pkgs, inputs, ... }: { 
  imports = [
    ./hardware-configuration.nix
    ../../modules/base/nixos

    ../../modules/desktop-environments/hyprland/nixos
    ../../modules/desktop-environments/common/nixos
    ../../modules/features/appimage/nixos
    ../../modules/features/kanata/nixos
    ../../modules/hardware/keyboard/keymap/nixos
    ../../modules/apps/dolphin/nixos
    ../../modules/services/syncthing/nixos
  ];

  networking.hostName = "voyager"; # Define your hostname.

  syncthing = {
      devices = {
        "phone" = { id = "3Y7HXLU-57OAFNZ-MO5PJ2T-PY7MOPA-U6RHHGF-4BUQEGX-7JRNZBZ-Q4CAAAP"; };
        "jupiter" = { id = "OJSGLW5-KQGAFU7-P2QBGSB-43EFXKE-LTN6NKO-BWAGK2J-KMDS7QG-F3WENAA"; };
        "rpi" = { id = ""; };
      };
      passwords.devices = [ "phone" "jupiter" "rpi" ];
      second-brain.devices = [ "phone" "jupiter" "rpi" ];
  };

  nix.settings.download-buffer-size = 1048576000; # 1GB 

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
