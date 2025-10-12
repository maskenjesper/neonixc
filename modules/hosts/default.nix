{inputs, ...}: {
  flake = {
    nixosConfigurations = {
      tellus = inputs.nixpkgs.lib.nixosSystem {
        modules = [../../profiles/tellus];
        specialArgs = {
          inherit inputs;
          localUsers = ["jakob"];
        };
      };

      rpi = inputs.nixpkgs.lib.nixosSystem {
        modules = [../../profiles/rpi];
        specialArgs = {
          inherit inputs;
          localUsers = ["jakob"];
        };
      };

      jupiter = inputs.nixpkgs.lib.nixosSystem {
        modules = [../../profiles/jupiter];
        specialArgs = {
          inherit inputs;
          localUsers = ["jakob"];
        };
      };

      voyager = inputs.nixpkgs.lib.nixosSystem {
        modules = [../../profiles/voyager];
        specialArgs = {
          inherit inputs;
          localUsers = ["jakob"];
        };
      };
    };
  };
}
