{ pkgs, ... }: 
{
  imports = [
    ../../../user/common
    ../../../user/terminal/shells/fish
    ../../../user/terminal/apps/tmux
    ../../../user/terminal/apps/git
    ../../../user/terminal/apps/gh
    ../../../user/terminal/apps/nixCats
  ];

  home.username = "user";
  home.homeDirectory = "/home/user";

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [

  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
