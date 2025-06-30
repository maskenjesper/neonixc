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
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/user/desktop-environments/hyprland/dotfiles";
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
