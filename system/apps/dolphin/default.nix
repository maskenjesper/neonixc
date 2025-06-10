{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        dolphin
        kdePackages.qtsvg
        kdePackages.kio-fuse
        kdePackages.kio-extras
    ];
}
