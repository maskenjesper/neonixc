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

  home.file.".config/niri" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/modules/desktop-environments/niri/homeManager/dotfiles";
    recursive = true;
  };

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
    rofi

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
