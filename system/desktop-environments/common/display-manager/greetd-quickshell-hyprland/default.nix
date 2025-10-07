{ config, lib, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "agreety --cmd Hyprland";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    hyprland
    fish
    bash
  '';
}
