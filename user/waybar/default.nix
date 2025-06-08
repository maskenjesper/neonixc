{
  pkgs,
  config,
  ...
}: {
  home.file.".config/waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/tellus/features/waybar/dotfiles";
    recursive = true;
  };
}
