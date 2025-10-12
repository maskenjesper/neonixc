{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../../common/waybar/homeManager
    ../../common/wofi/homeManager
    ../../common/stylix/homeManager
    ../../common/quickshell/homeManager
  ];

  home.file.".config/hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/modules/desktop-environments/hyprland/homeManager/dotfiles";
    recursive = true;
  };

  # Explicitly avoids conficts with uswm
  wayland.windowManager.hyprland.systemd.enable = false;

  home.packages = with pkgs; [


    networkmanagerapplet
    gucharmap
    alarm-clock-applet
    resources
    usbimager
    galculator

    hyprshot
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    waypaper
    swww
    swaybg
    # Notifications
    swaynotificationcenter
    libnotify # notification dep

    # Locking
    hyprlock

    hyprsunset
    hyprpolkitagent
    hyprpicker
    hypridle

    # Panel and widgets
    waybar

    # App launcher
    rofi-wayland

    # Clipboard management
    wl-clipboard
    cliphist

#####################
    # Disk usage analyzer
    baobab

    # Disks utitlity
    gnome-disk-utility
    udisks
    udisks2
    udiskie

    # Camera utility
    guvcview
  ];
}
