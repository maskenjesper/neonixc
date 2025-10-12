{
  perSystem = {self', ...}: {
    apps = {
      default = self'.apps.install;

      install = {
        type = "app";
        program = "${self'.packages.install}/bin/install";
      };
    };
  };
}
