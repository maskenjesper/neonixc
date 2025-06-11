
{pkgs, config, ...}: {

  environment.systemPackages = with pkgs; [
    mangohud
    lutris
    r2modman
    gamescope
    protonup-qt
    gamemode
    vulkan-tools
    mesa
    wayland-protocols
    xwayland
  ];

  programs = {
    steam.enable = true;
    steam.gamescopeSession.enable = true;
    gamemode.enable = true;
  };
}
