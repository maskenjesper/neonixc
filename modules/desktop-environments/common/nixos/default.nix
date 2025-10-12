{pkgs, ...}: {
  imports = [
    ../system-utils/stylix/nixos
    ../system-utils/audio/nixos
    ../system-utils/printing/nixos
    ../system-utils/bluetooth/nixos
    ../system-utils/disks/nixos
  ];
  services.xserver.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
