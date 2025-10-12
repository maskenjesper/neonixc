{
  pkgs,
  config,
  ...
}: {

  home.file.".config/quickshell" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/modules/desktop-environments/common/quickshell/homeManager/dotfiles";
    recursive = true;
  };
}
