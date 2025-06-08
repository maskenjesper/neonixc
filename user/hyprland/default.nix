{
  pkgs,
  config,
  ...
}: {
  home.file.".config/hypr" = {
    # Sadly, the line below forces this repository to be placed directly under the users home and have the name nixc. I can live with this however.
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/tellus/features/hyprland/dotfiles";
    recursive = true;
  };

  # Explicitly avoids conficts with uswm
  wayland.windowManager.hyprland.systemd.enable = false;
}
