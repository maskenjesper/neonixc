{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/base/nixos

    ../../modules/services/ssh/nixos
    ../../modules/features/nix_ld/nixos
    ../../modules/features/docker/nixos
  ];

  networking.hostName = "tellus"; # Define your hostname.

  users.users."jakob".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIME9fphOgNX9tRi5vFwzxtahA5ErQAqFPxjN6a1qLs6z jakob"
  ];

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
