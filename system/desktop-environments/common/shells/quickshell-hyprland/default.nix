{inputs, ...}: {

    imports = [
        ../../display-manager/greetd-quickshell-hyprland
    ];

    environment.systemPackages = [
        inputs.quickshell.packages."x86_64-linux".default
    ];

}
