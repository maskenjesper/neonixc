{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "jakob";
    userEmail = "noreply@email.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
    settings = {
      pull.rebase = false;
    };
  };
  programs.lazygit.enable = true;
}
