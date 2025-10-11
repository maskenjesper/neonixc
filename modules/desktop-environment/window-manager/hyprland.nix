{ pkgs, ... }: {

  flake.module.nixos = {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };
    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
  };
}
