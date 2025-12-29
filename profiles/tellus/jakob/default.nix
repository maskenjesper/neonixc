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
    ../../../modules/terminal/emulators/ghostty/homeManager
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
    tree
    gedit
    nixpkgs-vet
    alejandra
    gitnr
    mission-center

    # Media

    # Office

    # Dev

    # Studies

    # Messaging

    # Browsers

    # Music

    # Productivity
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
