{pkgs, ...}: {
  # Virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
