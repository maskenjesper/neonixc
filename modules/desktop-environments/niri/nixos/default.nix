{pkgs, ...}: {
  imports = [
    ../../common/quickshell/nixos
    ../../common/nixos
  ];

  programs.niri = {
    enable = true;
  };

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
  ];
}
