{
  inputs,
  lib,
  ...
}: let
  systems = ["x86_64-linux"];
  pkgsFor = lib.genAttrs systems (
    system:
      import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      }
  );
in {
  flake = {
    homeConfigurations = {
      "jakob@tellus" = inputs.home-manager.lib.homeManagerConfiguration {
        modules = [./profiles/tellus/jakob ./tasks];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};
      };

      "jakob@rpi" = inputs.home-manager.lib.homeManagerConfiguration {
        modules = [./profiles/rpi/jakob ./tasks];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};
      };

      "jakob@jupiter" = inputs.home-manager.lib.homeManagerConfiguration {
        modules = [./profiles/jupiter/jakob ./tasks];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};
      };

      "jakob@voyager" = inputs.home-manager.lib.homeManagerConfiguration {
        modules = [./profiles/voyager/jakob ./tasks];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};
      };
    };
  };
}
