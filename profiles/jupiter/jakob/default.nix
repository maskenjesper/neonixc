{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../../modules/base/homeManager

    ../../../modules/terminal/apps/hello/homeManager
    ../../../modules/desktop-environments/hyprland/homeManager
    ../../../modules/terminal/apps/nixCats/homeManager
    ../../../modules/terminal/apps/tmux/homeManager
    ../../../modules/terminal/apps/git/homeManager
    ../../../modules/terminal/apps/gh/homeManager
    ../../../modules/terminal/apps/direnv/homeManager
    ../../../modules/terminal/emulators/kitty/homeManager
    ../../../modules/terminal/shells/fish/homeManager
    ../../../modules/apps/zen-browser/homeManager
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-gtk3-1.1.07"
  ];

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [
    # Trying out
    hardinfo2
    teams-for-linux
    tree
    gedit
    kdePackages.kate
    keepassxc
    obsidian
    cool-retro-term
    
    neovide

    ventoy-full-gtk

    lua
    arduino

    netbeans
    sublime

    protonmail-desktop

    nixpkgs-vet

    alejandra

    cmatrix
    xaos
    electricsheep

    github-desktop

    freecad-wayland
    openscad

    gitnr

    element-desktop

    mission-center
    furmark
    hwinfo

    kicad-small
    freecad-wayland

    # don't know if this is needed

    # Media
    vlc
    audacity
    rnote
    sweethome3d.application

    # Office
    masterpdfeditor

    # Dev

    # Studies
    anki-bin
    exercism

    # Messaging
    discord
    signal-desktop

    # Browsers

    # Music
    spotify

    # Productivity
    pomodoro-gtk
    blanket
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
