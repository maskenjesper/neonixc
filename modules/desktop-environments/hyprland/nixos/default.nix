{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
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

    hardware.graphics = {
      package = pkgs-unstable.mesa;
      enable32Bit = true;
      package32 = pkgs-unstable.pkgsi686Linux.mesa;
    };

    environment.sessionVariables = {
      wlr_no_hardware_cursors = "1";
      nixos_ozone_wl = "1";
    };
  };
}
