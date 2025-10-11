{pkgs, ...}: {

    flake.imports = [

    ];

    flake.modules = {

        nixos.dolphin = {
            environment.systemPackages = with pkgs; [
                kdePackages.dolphin
                kdePackages.qtsvg
                kdePackages.kio-fuse
                kdePackages.kio-extras
            ];

        };

    };

}
