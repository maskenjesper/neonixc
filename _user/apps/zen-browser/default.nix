{inputs, config, lib, ...}: {
    options.zen-browser.system = lib.mkOption {
        type = lib.types.string;
        default = "x86_64-linux";
    };

    config = {
        home.packages = [
            inputs.zen-browser.packages."${config.zen-browser.system}".twilight
        ];
    };
}
