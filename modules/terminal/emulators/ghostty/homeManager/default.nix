{pkgs, ...}: {
  home.file.".config/ghostty" = {
    source = ./dotfiles;
    recursive = true;
  };

  stylix.targets.ghostty.enable = true;
  programs.ghostty = {
    enable = true;
    package =
      if pkgs.stdenv.isDarwin
      then pkgs.ghostty-bin
      else pkgs.ghostty;

    # Enable for whichever shell you plan to use!
    # enableBashIntegration = true;
    enableFishIntegration = true;
    # enableZshIntegration = true;

    settings = {
      custom-shader = [
        "./shaders/cursor_smear_fade.glsl"
        # "./shaders/cursor_blaze.glsl"
        # "./shaders/cursor_blaze_no_trail.glsl"
      ];
      font-size = 15;
      font-family = "Fira Code Nerd Font";
      background-opacity = "0.9";
    };
  };
}
