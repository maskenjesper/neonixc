{
  pkgs,
  ...
}: 
{
  imports = [
    ../../../user/common
    ../../../user/terminal/apps/nixCats
    ../../../user/terminal/apps/tmux
    ../../../user/terminal/apps/git
    ../../../user/terminal/apps/gh
    ../../../user/terminal/apps/direnv
    ../../../user/terminal/emulators/kitty
    ../../../user/terminal/shells/fish
    ../../../user/desktop-environments/hyprland
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [
    # Trying out
    udiskie

    # don't know if this is needed
    appimage-run
    nix-index
    vncdo
    ripgrep
    zoxide
    fzf

    # Media
    vlc
    shotcut
    audacity
    rnote
    sweethome3d.application

    # Office
    masterpdfeditor

    # Dev

    # Studies
    anki-bin

    # CLI utilities
    lazygit
    zip
    unzip
    htop
    killall
    playerctl
    neofetch
    lm_sensors
    hddtemp
    wget
    curl

    # GUI utilities
    guvcview
    alarm-clock-applet
    resources
    nautilus
    usbimager
    galculator
    gnome-disk-utility
    udisks
    baobab
    pwvucontrol
    gucharmap

    # Messaging
    discord

    # Browsers
    vivaldi

    # Music
    spotify

    # Networking
    traceroute
    networkmanagerapplet

    # Productivity
    pomodoro-gtk
    blanket
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
