{ pkgs, inputs, ... }: 
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
    ../../../user/apps/zen-browser
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [
    # Trying out
    tree
    gnucash
    homebank
    kmymoney
    syncthing
    syncthingtray




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
