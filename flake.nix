{
  description = "My first flake!";

  inputs = {
    # nix eco-system
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-treesitter.url = "github:nixos/nixpkgs/932fc16b263f26803d3960e4400bc13dde84a972";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # other
    stylix.url = "github:danth/stylix/release-24.11";
    xremap = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dzgui-nix = {
      url = "github:lelgenio/dzgui-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      # add ?ref=<tag> to track a tag
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    flake-parts,
    nixpkgs,
    home-manager,
    self,
    ...
  }: let
    inherit (self) outputs;

    lib = nixpkgs.lib // home-manager.lib;

    systems = ["x86_64-linux"];

    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});

    forAllSystems = inputs.nixpkgs.lib.genAttrs systems;
    nixpkgsFor =
      forAllSystems (system: import inputs.nixpkgs {inherit system;});

    pkgsFor = lib.genAttrs systems (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );
  in
    flake-parts.lib.mkFlake {inherit inputs;}
    {
      imports = [
      ];

      systems = ["x86_64-linux"];

      perSystem = {
        pkgs,
        self',
        system,
        inputs',
        ...
      }: {
        packages = {
          default = self'.packages.install;

          install = pkgs.writeShellApplication {
            name = "install";
            runtimeInputs = with pkgs; [git inputs'.home-manager.packages.${system}.home-manager];
            text = ''${.assets/scripts/install.sh} "$@"'';
          };
        };

        apps = {
          default = self'.apps.install;

          install = {
            type = "app";
            program = "${self'.packages.install}/bin/install";
          };
        };

        formatter = pkgs.alejandra;
      };

      flake = {
        nixosConfigurations = {
          tellus = lib.nixosSystem {
            modules = [./profiles/tellus];
            specialArgs = {
              inherit inputs outputs;
              localUsers = ["jakob"];
            };
          };

          rpi = lib.nixosSystem {
            modules = [./profiles/rpi];
            specialArgs = {
              inherit inputs outputs;
              localUsers = ["jakob"];
            };
          };

          jupiter = lib.nixosSystem {
            modules = [./profiles/jupiter];
            specialArgs = {
              inherit inputs outputs;
              localUsers = ["jakob"];
            };
          };

          voyager = lib.nixosSystem {
            modules = [./profiles/voyager];
            specialArgs = {
              inherit inputs outputs;
              localUsers = ["jakob"];
            };
          };
        };

        homeConfigurations = {
          "jakob@tellus" = inputs.home-manager.lib.homeManagerConfiguration {
            modules = [./profiles/tellus/jakob ./tasks];
            pkgs = pkgsFor.x86_64-linux;
            extraSpecialArgs = {inherit inputs outputs;};
          };

          "jakob@rpi" = inputs.home-manager.lib.homeManagerConfiguration {
            modules = [./profiles/rpi/jakob ./tasks];
            pkgs = pkgsFor.x86_64-linux;
            extraSpecialArgs = {inherit inputs outputs;};
          };

          "jakob@jupiter" = inputs.home-manager.lib.homeManagerConfiguration {
            modules = [./profiles/jupiter/jakob ./tasks];
            pkgs = pkgsFor.x86_64-linux;
            extraSpecialArgs = {inherit inputs outputs;};
          };

          "jakob@voyager" = inputs.home-manager.lib.homeManagerConfiguration {
            modules = [./profiles/voyager/jakob ./tasks];
            pkgs = pkgsFor.x86_64-linux;
            extraSpecialArgs = {inherit inputs outputs;};
          };
        };
      };
    };
}
