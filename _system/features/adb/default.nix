{lib, localUsers, ...}: {
  programs.adb.enable = true;
  users.users = lib.genAttrs localUsers (user: {
    extraGroups = ["adbusers"];
  });


  boot.kernelModules = ["v4l2loopback"];
  services.hardware.bolt.enable = true;

}
