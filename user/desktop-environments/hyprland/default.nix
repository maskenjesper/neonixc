{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./submodules/waybar
    ./submodules/wofi
    ./submodules/stylix
  ];

  home.file.".config/hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink ./. + "/dotfiles";
    recursive = true;
  };

  # Explicitly avoids conficts with uswm
  wayland.windowManager.hyprland.systemd.enable = false;
}
