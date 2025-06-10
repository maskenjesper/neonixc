{pkgs, ...}: {
    home.packages = with pkgs; [
        libsForQt5.konqueror
        ffmpegthumbnailer
        libsForQt5.kdegraphics-thumbnailers
        libsForQt5.ffmpegthumbs
        libsForQt5.kio-extras
    ];
}
