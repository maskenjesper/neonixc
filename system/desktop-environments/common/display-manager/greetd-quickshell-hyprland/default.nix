{ config, lib, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/hyprland";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    hyprland
    fish
    bash
    startxfce4
  '';
}
