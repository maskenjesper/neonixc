{
  pkgs,
  config,
  outputs,
  ...
}: {
  home.file.".config/kitty" = {
    # for some reaseon this doesn't work: config.lib.file.mkOutOfStoreSymlink
    # source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/common/features/terminal/kitty/dotfiles";
    source = ./dotfiles;
    recursive = true;
  };

  programs.kitty.enable = true;
}
