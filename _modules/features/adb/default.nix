{lib, ...}: 
let
  localUsers = ["jakob"];
in 
{

    flake.imports = [

    ];

    flake.modules = {

        nixos.adb = {
          programs.adb.enable = true;
          users.users = lib.genAttrs localUsers (user: {
            extraGroups = ["adbusers"];
          });


          boot.kernelModules = ["v4l2loopback"];
          services.hardware.bolt.enable = true;

        };

    };

}
