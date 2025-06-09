{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;

    targets.wezterm.enable = false;
    targets.mako.enable = false;

    polarity = "dark";

    image = ../../../../../assets/active_wallpaper.jpg;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/pandora.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    # base16Scheme = ./kanagawa-dragon.yaml;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "Fira Code";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
  };
}
