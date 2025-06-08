{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../../user/global
    ../../../user/nixCats
    ../../../user/git
    ../../../user/gh
    ../../../user/kitty
    ../../../user/fish
    ../../../user/tmux
    ../../../user/hyprland
    ../../../user/waybar
    ../../../user/wofi
    ../../../user/stylix
    ../../../user/xremap
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [
    # Trying out
    udiskie

    # Media
    vlc
    shotcut
    audacity
    rnote
    sweethome3d.application

    # Office
    masterpdfeditor
    evince
    libreoffice

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
    filezilla

    # Messaging
    thunderbird
    discord
    telegram-desktop

    # Browsers
    vivaldi

    # Music
    spotify

    # Notes
    obsidian

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
