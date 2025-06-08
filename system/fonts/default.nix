{pkgs, ...}: {
  fonts.packages = with pkgs; [
    font-awesome_6
    noto-fonts-extra
  ];
}
