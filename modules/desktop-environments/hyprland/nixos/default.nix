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
    inputs.hyprland.nixosModules.default
  ];

  options = {
    hyprland.enabled = lib.mkOption {type = lib.types.bool;};
  };

  config = {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      plugins = [
        inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprscrolling
      ];
    };
    environment.sessionVariables = {
      wlr_no_hardware_cursors = "1";
      nixos_ozone_wl = "1";
    };
  };
}
