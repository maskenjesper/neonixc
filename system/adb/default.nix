{lib, ...}: {
  programs.adb.enable = true;
# TODO remove hardcoded user
  users.users.jakob.extraGroups = ["adbusers"];
  boot.kernelModules = ["v4l2loopback"];
  services.hardware.bolt.enable = true;
}
