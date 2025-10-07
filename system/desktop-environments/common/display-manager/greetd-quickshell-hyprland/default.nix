{ config, lib, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    hyprland
    fish
    bash
  '';
}
