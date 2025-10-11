{pkgs, ...}: {

    flake.imports = [

    ];

    flake.modules = {

        nixos.appimage = {
            programs.appimage = {

                enable = true;
                binfmt = true;
                package = pkgs.appimage-run.override { 
                    extraPkgs = pkgs: [
                        pkgs.python312
                    ];
                };
            };

        };

    };

}
