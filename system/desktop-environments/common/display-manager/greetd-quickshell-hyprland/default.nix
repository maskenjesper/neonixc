{ config, lib, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland --config /home/jakob/.config/hypr/hyprland.conf";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    hyprland
    fish
    bash
  '';
}
