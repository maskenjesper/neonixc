{pkgs, ...}: {

    flake.imports = [

    ];

    flake.modules = {

        nixos.teamviewer = {
          services.teamviewer.enable = true;

          environment.systemPackages = with pkgs; [
            teamviewer
          ];

        };

    };

}
