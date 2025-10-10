{ pkgs, inputs, ... }: { 
  imports = [
    ./hardware-configuration.nix 

    ../../system/common
    ../../system/desktop-environments/hyprland
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

  # Disable kernel messages in the console (tty)
  # To avoid the error message: 
  #     usb 1-4: device descriptor read/all, error -110
  # on the login screen.
  # TODO: Figure out why this is happening.
  boot.kernel.sysctl = {
    "kernel.printk" = "3 3 3 3";
  };

  syncthing = {
      devices = {
        "phone" = { id = "3Y7HXLU-57OAFNZ-MO5PJ2T-PY7MOPA-U6RHHGF-4BUQEGX-7JRNZBZ-Q4CAAAP"; };
        "voyager" = { id = "NGB3ZV7-5TUJBHD-S4G55WQ-GB2IJKU-T27F57R-KYUUW6O-ABBPROL-WXS3WAW"; };
        "rpi" = { id = ""; };
      };
      passwords.devices = [ "phone" "voyager" "rpi" ];
      second-brain.devices = [ "phone" "voyager" "rpi" ];
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
