{config, ...}: {

    home.file.".hello-world" = {
        source = config.lib.file.mkOutOfStoreSymlink "./dotfiles";
    };

}
