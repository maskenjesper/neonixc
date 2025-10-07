{
  pkgs,
  config,
  ...
}: {

  home.file.".config/quickshell" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/user/desktop-environments/common/quickshell/Caelestia";
    recursive = true;
  };
}
