{...}: {

    flake.imports = [

    ];

    flake.modules = {

        nixos.virtualization = {
          # Virt-manager
          virtualisation.libvirtd.enable = true;
          programs.virt-manager.enable = true;

        };

    };

}
