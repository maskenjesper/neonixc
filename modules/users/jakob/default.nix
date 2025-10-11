{
  config,
  ...
}:
{
  flake = {
    meta.users = {
      jakob = {
        email = "jakobolsson973@gmail.com";
        name = "Jakob Olsson";
        username = "jakob";
        key = ""; # ed25519/0x0AAF2901E8040715
        keygrip = [
          "" # rsa4096/0xD476DFE9C67467CA
        ];
        authorizedKeys = [
          ""
        ];
      };
    };

    modules.nixos.jakob =
      { pkgs, ... }:
      {

        programs.fish.enable = true;

        users.users.jakob = {
          description = config.flake.meta.users.jakob.name;
          isNormalUser = true;
          createHome = true;
          extraGroups = [
            "audio"
            "input"
            "networkmanager"
            "sound"
            "tty"
            "wheel"
          ];
          shell = pkgs.fish;
          openssh.authorizedKeys.keys = config.flake.meta.users.jakob.authorizedKeys;
          initialPassword = "id";
        };

        nix.settings.trusted-users = [ config.flake.meta.users.jakob.username ];

        home-manager.users.jakob = {
          home.file = {
            ".face" = {
              source = ../../../files/home/jakob/.face;
              recursive = true;
            };
            ".face.icon" = {
              source = ../../../files/home/jakob/.face;
              recursive = true;
            };
            # Credits to https://store.kde.org/p/1272202
            "Pictures/Backgrounds/" = {
              source = ../../../files/home/jakob/Pictures/Backgrounds;
              recursive = true;
            };
          };
        };
      };
  };
}
