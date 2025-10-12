
{pkgs, ...}: {

  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    lutris
    r2modman
    protonup-qt
    gamemode
    vulkan-tools
    mesa
    wayland-protocols
    xwayland
    xorg.libxcb

    (heroic.override {
        extraPkgs = pkgs: [
            pkgs.gamescope
        ];
    })
  ];

  

  programs = {
    steam.enable = true;
    steam.gamescopeSession.enable = true;
    gamemode.enable = true;
    gamescope.enable = true;
  };
}
