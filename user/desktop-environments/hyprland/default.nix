{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./submodules/waybar
    ./submodules/wofi
    ./submodules/stylix
  ];

  home.file.".config/hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink ./. + "/dotfiles";
    recursive = true;
  };

  # Explicitly avoids conficts with uswm
  wayland.windowManager.hyprland.systemd.enable = false;

  home.packages = with pkgs; [
    networkmanagerapplet
    gucharmap
    alarm-clock-applet
    resources
    nautilus
    usbimager
    galculator

    # Disk usage analyzer
    baobab

    # Disks utitlity
    gnome-disk-utility
    udisks
    udisks2
    udiskie

    # Disks utitlity
    guvcview
  ];
}
