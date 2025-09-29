{
  pkgs,
  config,
  ...
}: {

  home.file.".config/quickshell" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/user/desktop-environments/hyprland/submodules/quickshell/dotfiles";
    recursive = true;
  };
}
