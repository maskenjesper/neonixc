{
  pkgs,
  config,
  ...
}: {

  home.file.".config/waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/jakob/neonixc/user/desktop-environments/hyprland/submodules/waybar/dotfiles";
    recursive = true;
  };
}
