{ pkgs, inputs, ... }: { 
  imports = [
    ./hardware-configuration.nix 

    ../../system/common
    ../../system/desktop-environments/hyprland
    ../../system/apps/_1password
    ../../system/apps/teamviewer
    ../../system/features/adb
    ../../system/features/appimage
    ../../system/hardware/keyboard/keymap
    ../../system/hardware/keyboard/xremap
    ../../system/services/syncthing
  ];

  networking.hostName = "voyager"; # Define your hostname.

  syncthing = {
      devices = {
        "phone" = { id = "3Y7HXLU-57OAFNZ-MO5PJ2T-PY7MOPA-U6RHHGF-4BUQEGX-7JRNZBZ-Q4CAAAP"; };
        "desktop" = { id = "OJSGLW5-KQGAFU7-P2QBGSB-43EFXKE-LTN6NKO-BWAGK2J-KMDS7QG-F3WENAA"; };
        "rpi" = { id = ""; };
      };
      passwords.devices = [ "phone" "rpi" ];
      second-brain.devices = [ "phone" "rpi" ];
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
