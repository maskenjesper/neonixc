{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../../modules/base/homeManager

    ../../../modules/terminal/apps/nixCats/homeManager
    ../../../modules/terminal/apps/tmux/homeManager
    ../../../modules/terminal/apps/git/homeManager
    ../../../modules/terminal/apps/gh/homeManager
    ../../../modules/terminal/emulators/ghostty/homeManager
    ../../../modules/terminal/apps/direnv/homeManager
    ../../../modules/terminal/shells/fish/homeManager
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [
    # Trying out
    anydesk
    tree
    nixpkgs-vet
    alejandra
    gitnr

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
