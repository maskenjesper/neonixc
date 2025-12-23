{pkgs, ...}: {
  home.packages = with pkgs; [
    codeblocksFull
    gcc
  ];
}
