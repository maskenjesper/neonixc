{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    ../../common/quickshell/nixos
    ../../common/nixos
  ];

  options = {
    hyprland.enabled = lib.mkOption {type = lib.types.bool;};
  };

  config = {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };
    environment.sessionVariables = {
      wlr_no_hardware_cursors = "1";
      nixos_ozone_wl = "1";
    };
  };
}
