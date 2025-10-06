{ pkgs, ... }: {
  imports = [
    ../../system-utils/stylix
    ../../system-utils/audio
    ../../system-utils/printing
    ../../system-utils/bluetooth
    ../../system-utils/disks
    ../../../apps/dolphin
  ];

  programs.niri = {
      enable = true;
  };

  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service
  security.pam.services.swaylock = {};
  
  programs.waybar.enable = true; # top bar
  environment.systemPackages = with pkgs; [ alacritty fuzzel swaylock mako swayidle ];

  # Enable inter-application communication
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
