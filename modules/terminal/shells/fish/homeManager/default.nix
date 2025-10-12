{ config, ... }: {
  home.file.".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/modules/terminal/shells/fish/homeManager/dotfiles";
    recursive = true;
  };

  programs = {
    tmux.enable = true;
    zoxide.enable = true;
    fzf.enable = true;
  };
}
