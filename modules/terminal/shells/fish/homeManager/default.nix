{ config, ... }: {
  home.file.".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/user/terminal/shells/fish/dotfiles";
    recursive = true;
  };

  programs = {
    tmux.enable = true;
    zoxide.enable = true;
    fzf.enable = true;
  };
}
