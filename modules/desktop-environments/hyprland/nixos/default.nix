{pkgs, ...}: {
  imports = [
    ../../common/quickshell/nixos
    ../../common/nixos
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  environment.sessionvariables = {
    wlr_no_hardware_cursors = "1";
    nixos_ozone_wl = "1";
  };
}
