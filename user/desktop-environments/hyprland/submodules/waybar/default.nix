{
  pkgs,
  config,
  ...
}: {

  home.file.".config/waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink ./. + "/dotfiles";
    recursive = true;
  };
}
