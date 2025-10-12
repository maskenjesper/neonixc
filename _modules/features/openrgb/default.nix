{pkgs, ...}: {

    flake.imports = [

    ];

    flake.modules = {

        nixos.openrgb = {
            environment.systemPackages = [
                pkgs.openrgb-with-all-plugins
            ];

            services.hardware.openrgb.enable = true;


        };

    };

}
