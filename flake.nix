{
  description = "My first flake!";

  inputs = {
    # nix eco-system
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-24_11.url = "nixpkgs/nixos-24.11";
    nixpkgs-treesitter.url = "github:nixos/nixpkgs/932fc16b263f26803d3960e4400bc13dde84a972";
            
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # other
    stylix.url = "github:danth/stylix/release-24.11";
    xremap.url = "github:xremap/nix-flake";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let

    inherit (self) outputs;

    lib = nixpkgs.lib // home-manager.lib;

    systems = ["x86_64-linux"];

    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});

    forAllSystems = inputs.nixpkgs.lib.genAttrs systems;
    nixpkgsFor =
      forAllSystems (system: import inputs.nixpkgs { inherit system; });

    pkgsFor = lib.genAttrs systems (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );

  in {
    inherit lib;
    formatter = forEachSystem (pkgs: pkgs.alejandra);

#    packages = forAllSystems (system:
#      let pkgs = nixpkgsFor.${system};
#      in {
#        install = pkgs.writeShellApplication {
#          name = "install";
#          runtimeInputs = with pkgs; [ git home-manager ];
#          text = ''${./assets/scripts/install.sh} "$@"'';
#        };
#      });
#
#    apps = forAllSystems (system: {
#      default = {
#        type = "app";
#        program = "${self.packages.${system}.install}/bin/install";
#      };
#    });

    packages = forAllSystems (system:
      let pkgs = nixpkgsFor.${system};
      in {
        default = self.packages.${system}.install;

        install = pkgs.writeShellApplication {
          name = "install";
          runtimeInputs = with pkgs; [ git inputs.home-manager.packages.${system}.home-manager ];
          text = ''${./assets/scripts/install.sh} "$@"'';
        };
      });

    apps = forAllSystems (system: {
      default = self.apps.${system}.install;

      install = {
        type = "app";
        program = "${self.packages.${system}.install}/bin/install";
      };
    });

    nixosConfigurations = {
      tellus = lib.nixosSystem {
        modules = [./profiles/tellus];
        specialArgs = {
          inherit inputs outputs; 
          users = ["jakob"];
        };
      };
    };

    homeConfigurations = {
      "jakob@tellus" = inputs.home-manager.lib.homeManagerConfiguration {
        modules = [./profiles/tellus/jakob ./tasks];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
      };
    };
  };
}
