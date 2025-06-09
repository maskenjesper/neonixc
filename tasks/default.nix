{ pkgs, config, ... }: {
  home.file.".config/just" = {
    source = config.lib.file.mkOutOfStoreSymlink ./dotfiles;
    recursive = true;
  };

  home.packages = with pkgs; [
    just
  ];
}
