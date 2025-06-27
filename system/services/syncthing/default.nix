
{localUsers, ...}: {

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
            devices = {
                "phone" = { id = "3Y7HXLU-57OAFNZ-MO5PJ2T-PY7MOPA-U6RHHGF-4BUQEGX-7JRNZBZ-Q4CAAAP"; };
            };
            folders = {
                "second-brain" = {
                    path = "/home/jakob/second-brain";
                    devices = [ "phone" ];
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

}
