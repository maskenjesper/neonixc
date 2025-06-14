{ config, ... }: {
  home.file.".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/jakob/neonixc/user/terminal/shells/fish/dotfiles";
    recursive = true;
  };

  programs = {
    tmux.enable = true;
    zoxide.enable = true;
    fzf.enable = true;
  };
}
