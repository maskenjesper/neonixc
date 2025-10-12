{...}: {

    flake.imports = [

    ];

    flake.modules = {

        nixos.bluetooth = {
          hardware.bluetooth.enable = true;
          hardware.bluetooth.powerOnBoot = true;
          services.blueman.enable = true; # Enables GUI applications for managing bluetooth connections

        };

        homeManager.bluetooth = {

        };

    };

}
