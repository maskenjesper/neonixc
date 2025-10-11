{lib, config, pkgs, ...}: 
let
  # The phone does not run nixos so this might change
  phoneId = "3Y7HXLU-57OAFNZ-MO5PJ2T-PY7MOPA-U6RHHGF-4BUQEGX-7JRNZBZ-Q4CAAAP";
in 
{

    flake.imports = [

    ];

    flake.modules = {

        nixos.syncthing = {

                options = {
                    syncthing = {
                        devices = lib.mkOption { type = lib.types.attrs; };
                        second-brain.devices = lib.mkOption { type = lib.types.listOf lib.types.str; };
                        passwords.devices = lib.mkOption { type = lib.types.listOf lib.types.str; };
                    };
                };
                
                config = 
                let
                  cfg = config.syncthing;
                in {
                    environment.systemPackages = with pkgs; [
                        syncthing
                    ];
                    # TODO remove hardcoded user
                    services.syncthing = {
                        enable = true;
                        dataDir = "home/jakob";
                        openDefaultPorts = true;
                        configDir = "/home/jakob/.config/syncthing";
                        user = "jakob";
                        group = "users";
                        guiAddress = "0.0.0.0:8384";
                        declarative = { 
                            overrideDevices = true;
                            overrideFolders = true;
                            devices = cfg.devices;
                            folders = {
                                "second-brain" = {
                                    path = "/home/jakob/second-brain";
                                    devices = cfg.second-brain.devices;
                                    versioning = {
                                        type = "staggered";
                                        params = {
                                            cleanInterval = "3600";
                                            maxAge = "15768000";
                                        };
                                    };
                                };
                                "passwords" = {
                                    path = "/home/jakob/passwords";
                                    devices = cfg.passwords.devices;
                                    versioning = {
                                        type = "staggered";
                                        params = {
                                            cleanInterval = "3600";
                                            maxAge = "15768000";
                                        };
                                    };
                                };
                            };
                        };
                    };
                };


        };

    };

}
