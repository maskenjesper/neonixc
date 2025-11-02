{pkgs, ...}: {
  imports = [
    ../../common/quickshell/nixos
    ../../common/nixos
  ];

  programs.niri = {
    enable = true;
  };
  # environment.sessionvariables = {
  #   wlr_no_hardware_cursors = "1";
  #   nixos_ozone_wl = "1";
  # };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service
  security.pam.services.swaylock = {};

  # Enable inter-application communication
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  programs.waybar.enable = true;
  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
    swaylock
    mako
    swayidle
    xwayland-satellite # xwayland support
  ];
}
