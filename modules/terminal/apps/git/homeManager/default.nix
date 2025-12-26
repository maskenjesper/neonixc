{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user.name = "jakob";
      user.email = "noreply@email.com";
      pull.rebase = false;
    };
  };
  programs.lazygit.enable = true;
}
