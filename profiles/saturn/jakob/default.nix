{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # nixified
    ../../../modules/terminal/apps/nixCats/homeManager
    ../../../modules/terminal/apps/direnv/homeManager
    ../../../modules/terminal/apps/tmux/homeManager

    # Only dots
    ../../../modules/terminal/emulators/kitty/homeManager/dotfiles.nix
    ../../../modules/terminal/apps/git/homeManager/dotfiles.nix
    ../../../modules/terminal/apps/gh/homeManager/dotfiles.nix
    ../../../modules/terminal/apps/lazygit/homeManager/dotfiles.nix
    ../../../modules/terminal/shells/fish/homeManager/dotfiles.nix

    ../../../modules/apps/opencode/homeManager/dotfiles.nix

    ../../../modules/desktop-environments/niri/homeManager/dotfiles.nix
    ../../../modules/desktop-environments/noctalia/homeManager/dotfiles.nix
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  # nixpkgs.config.permittedInsecurePackages = [
  #   "ventoy-gtk3-1.1.07"
  # ];

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [
    # Trying out
    keepassxc
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
