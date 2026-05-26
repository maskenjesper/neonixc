{config, ...}: {
  home.file.".config/opencode" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/apps/opencode/homeManager/dotfiles";
    recursive = true;
  };
}
