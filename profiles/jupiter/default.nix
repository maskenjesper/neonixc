{ pkgs, inputs, ... }: { 
  imports = [
    ./hardware-configuration.nix 

    ../../system/common
    ../../system/desktop-environments/variations/hyprland-v1
    ../../system/apps/_1password
    ../../system/apps/teamviewer
    ../../system/features/adb
    ../../system/features/gaming 
    ../../system/features/virtualization
    ../../system/features/appimage
    ../../system/features/stess_and_bench
    ../../system/hardware/keyboard/keymap
    ../../system/hardware/keyboard/xremap
    ../../system/hardware/amd-gpu
    ../../system/services/syncthing
    ../../system/services/openrgb
  ];

  networking.hostName = "jupiter"; # Define your hostname.

  syncthing = {
      devices = {
        "phone" = { id = "3Y7HXLU-57OAFNZ-MO5PJ2T-PY7MOPA-U6RHHGF-4BUQEGX-7JRNZBZ-Q4CAAAP"; };
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
    inputs.dzgui-nix.packages.x86_64-linux.default
  ];

  system.stateVersion = "24.05";
}
