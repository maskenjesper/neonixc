{config, ...}: {

    home.file.".hello-world" = {
        source = config.lib.file.mkOutOfStoreSymlink (builtins.toString ./dotfiles);
    };

}
