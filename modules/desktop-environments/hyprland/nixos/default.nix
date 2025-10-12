{pkgs, ...}: {
  imports = [
    ../../common/system-utils/stylix/nixos
    ../../common/system-utils/audio/nixos
    ../../common/system-utils/printing/nixos
    ../../common/system-utils/bluetooth/nixos
    ../../common/system-utils/disks/nixos
    ../../common/quickshell/nixos
    ../../../apps/dolphin/nixos
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  systemd.services.display-manager.enable = false;

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  #services.xserver.displayManager.sddm.theme = "where_is_my_sddm_theme";

  # Enable inter-application communication
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
