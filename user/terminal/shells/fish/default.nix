{ config, ... }: {
  home.file.".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "~/neonixc/user/terminal/shells/fish/dotfiles";
    recursive = true;
  };

  programs = {
    tmux.enable = true;
    zoxide.enable = true;
    fzf.enable = true;
  };
}
