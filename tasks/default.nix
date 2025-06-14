{ pkgs, config, ... }: {
  home.file.".config/just" = {
    source = config.lib.file.mkOutOfStoreSymlink "~/neonixc/tasks/dotfiles";
    recursive = true;
  };

  home.packages = with pkgs; [
    just
  ];
}
