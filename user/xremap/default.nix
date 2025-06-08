{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = [
    inputs.xremap.packages.x86_64-linux.default
    pkgs.wtype
  ];

  home.file.".config/xremap" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/tellus/features/xremap/dotfiles";
    recursive = true;
  };
}
