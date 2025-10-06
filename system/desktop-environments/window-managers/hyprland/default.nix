{ pkgs, ... }: {

  #programs.uwsm = {
  #  enable = true;
  #  waylandCompositors.hyprland = {
  #    binPath = "/run/current-system/sw/bin/Hyprland";
  #    comment = "Hyprland session managed by uwsm";
  #    prettyName = "Hyprland";
  #  };
  #};
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

#  services.displayManager.sddm = {
#      enable = true;
#      wayland.enable = true;
#  };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  #services.xserver.displayManager.sddm.theme = "where_is_my_sddm_theme";

  # Enable inter-application communication
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  environment.systemPackages = with pkgs; [
    where-is-my-sddm-theme 


  ];
}
