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

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
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
    import-tree.url = "github:vic/import-tree";
    gittype.url = "github:unhappychoice/gittype";
  };

  outputs = inputs @ {
    flake-parts,
    import-tree,
    nixpkgs,
    self,
    ...
  }: let
    inherit (self) outputs;

    systems = ["x86_64-linux" "aarch64-linux"];

    pkgsFor = inputs.nixpkgs.lib.genAttrs systems (
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
        ./modules/flake
        ./modules/hosts
      ];

      systems = ["x86_64-linux" "aarch64-linux"];

      flake = {
        homeConfigurations = {
          "jakob@tellus" = inputs.home-manager.lib.homeManagerConfiguration {
            modules = [./profiles/tellus/jakob ./tasks];
            pkgs = pkgsFor.x86_64-linux;
            extraSpecialArgs = {inherit inputs outputs;};
          };

          "jakob@rpi" = inputs.home-manager.lib.homeManagerConfiguration {
            modules = [./profiles/rpi/jakob ./tasks];
            pkgs = pkgsFor.aarch64-linux;
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
