{pkgs, ...}: {

    flake.imports = [

    ];

    flake.modules = {

        nixos.stress-and-bench = {
          environment.systemPackages = with pkgs; [
            geekbench_6
            phoronix-test-suite
            stress-ng
          ];

        };

    };

}
