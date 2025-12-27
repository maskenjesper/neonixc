{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/base/nixos
  ];

  networking.hostName = "hostname"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    # Avoid adding packages here.
  ];

  system.stateVersion = "24.05";
}
