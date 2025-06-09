# This file (and the global directory) holds config that i use on all hosts
{
  inputs,
  outputs,
  pkgs,
  ...
}: {

  environment.shells = with pkgs; [bashInteractive];
  users.defaultUserShell = pkgs.bash;

  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  services.flatpak.enable = true;

  nix.settings.auto-optimise-store = true;

  # Automatically delete generations older than 30 days.
  nix.gc = {
    automatic = true;
    dates = "weelky";
    options = "--delete-older-than 30d";
  };

  # Use flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
