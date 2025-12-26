{...}: {
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    # TODO how do I not hardcode this
    flake = "/home/jakob/neonixc"; # sets NH_OS_FLAKE variable for you
  };
}
