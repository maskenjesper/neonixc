{
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
        text = ''${../../assets/scripts/install.sh} "$@"'';
      };
    };
  };
}
