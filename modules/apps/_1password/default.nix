{lib, config, ...}: {
    options = {
        evalClass = lib.mkOption { type = lib.types.enum ["nixos" "homeManager"]; };
    };

    config = lib.mkIf (config.evalClass == "nixos") {
        imports = [
            ./nixos
        ];
    };
}
