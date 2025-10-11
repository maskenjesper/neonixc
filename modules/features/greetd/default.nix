{pkgs, ...}: {

    flake.imports = [

    ];

    flake.modules = {

        nixos.greetd = {
            services.greetd = {
                enable = true;
                settings = {
                    default_session = {
                        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd \"uwsm start default\"";
                    };
                };
            };

        };

    };

}
