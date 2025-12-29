{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/base/nixos

    ../../modules/apps/teamviewer/nixos
    ../../modules/features/virtualization/nixos
    ../../modules/features/appimage/nixos
    ../../modules/hardware/nvidia/nixos
    ../../modules/services/ssh/nixos
    ../../modules/features/nix_ld/nixos
    ../../modules/features/docker/nixos
  ];

  networking.hostName = "tellus"; # Define your hostname.

  # Disable kernel messages in the console (tty)
  # To avoid the error message:
  #     usb 1-4: device descriptor read/all, error -110
  # on the login screen.
  # TODO: Figure out why this is happening.
  boot.kernel.sysctl = {
    "kernel.printk" = "3 3 3 3";
  };

  nix.settings.download-buffer-size = 1048576000; # 1GB

  users.users.jakob = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "Jakob Olsson";
    extraGroups = ["networkmanager" "wheel" "dialout"];
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
