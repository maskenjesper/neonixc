{ config, lib, pkgs, ... }:
let
  hyprConfig = pkgs.writeText "greetd-hypr-config" ''
    exec-once = "${pkgs.greetd.qtgreet}/bin/qtgreet; hyprctl dispatch exit"
  '';
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland --config ${hyprConfig}";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    hyprland
    fish
    bash
  '';
}
