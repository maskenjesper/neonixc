{pkgs, ...}: {
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,se";
    variant = "";
    options = "grp:win_space_toggle";
  };
}
