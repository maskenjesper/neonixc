{pkgs, ...}: {
  imports = [
    ../../common/system-utils/stylix/nixos
    ../../common/system-utils/audio/nixos
    ../../common/system-utils/printing/nixos
    ../../common/system-utils/bluetooth/nixos
    ../../common/system-utils/disks/nixos
    ../../common/shells/quickshell/nixos
    ../../../apps/dolphin/nixos
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
}
