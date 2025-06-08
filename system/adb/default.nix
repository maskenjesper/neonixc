{lib, ...}: {
  programs.adb.enable = true;
# TODO remove hardcoded user
  users.users.jakob.extraGroups = ["adbusers"];
}
