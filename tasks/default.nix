{ pkgs, config, ... }: {
  home.file.".config/just" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/jakob/neonixc/tasks/dotfiles";
    recursive = true;
  };

  home.packages = with pkgs; [
    just
  ];
}
