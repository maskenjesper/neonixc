{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        kdePackages.dolphin
        kdePackages.qtsvg
        kdePackages.kio-fuse
        kdePackages.kio-extras
    ];
}
