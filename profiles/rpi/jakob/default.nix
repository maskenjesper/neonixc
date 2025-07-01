{ pkgs, inputs, ... }: 
{
  imports = [
    ../../../user/common
    ../../../user/terminal/apps/nixCats
    ../../../user/terminal/apps/tmux
    ../../../user/terminal/apps/git
    ../../../user/terminal/apps/gh
    ../../../user/terminal/shells/fish
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [
    # Trying out
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
