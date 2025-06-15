{ pkgs, ... }: 
{
  imports = [
    ../../../user/common
  ];

  home.username = "user";
  home.homeDirectory = "/home/user";

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [

  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
