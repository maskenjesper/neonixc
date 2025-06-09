{ config, ... }: {
  home.file.".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink ./. + "/dotfiles";
    recursive = true;
  };

  programs = {
    tmux.enable = true;
    zoxide.enable = true;
    fzf.enable = true;
  };
}
