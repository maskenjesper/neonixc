{ pkgs, inputs, ... }: 
{
  imports = [
    ../../../modules/base/homeManager

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

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [
    # Trying out
    tree
    keepassxc
    obsidian
    cool-retro-term


    # Media
    vlc
    audacity
    rnote
    sweethome3d.application

    # Office
    masterpdfeditor
    gedit

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
