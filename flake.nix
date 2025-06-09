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
