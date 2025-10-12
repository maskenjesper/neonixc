{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/base/nixos

    ../../modules/terminal/apps/hello/nixos
    ../../modules/desktop-environments/hyprland/nixos
    ../../modules/apps/_1password/nixos
    ../../modules/apps/teamviewer/nixos
    ../../modules/features/adb/nixos
    ../../modules/features/gaming/nixos
    ../../modules/features/virtualization/nixos
    ../../modules/features/appimage/nixos
    ../../modules/features/stess_and_bench/nixos
    ../../modules/hardware/keyboard/keymap/nixos
    ../../modules/hardware/keyboard/xremap/nixos
    ../../modules/hardware/amd-gpu/nixos
    ../../modules/services/syncthing/nixos
    ../../modules/services/openrgb/nixos
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
      "phone" = {id = "3Y7HXLU-57OAFNZ-MO5PJ2T-PY7MOPA-U6RHHGF-4BUQEGX-7JRNZBZ-Q4CAAAP";};
      "laptop" = {id = "NGB3ZV7-5TUJBHD-S4G55WQ-GB2IJKU-T27F57R-KYUUW6O-ABBPROL-WXS3WAW";};
      "rpi" = {id = "";};
    };
    passwords.devices = ["phone" "rpi"];
    second-brain.devices = ["phone" "rpi"];
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
