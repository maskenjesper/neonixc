{config, inputs, ...}: {

    flake.imports = [

    ];

    flake.modules = {

        nixos.quickshell = {
            environment.systemPackages = [
                inputs.quickshell.packages."x86_64-linux".default
            ];

        };

        homeManager.quickshell = {

          home.file.".config/quickshell" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/user/desktop-environments/common/quickshell/dotfiles";
            recursive = true;
          };

        };

    };

}
