{
  pkgs,
  inputs,
  localUsers,
  ...
}: {
  
  environment.systemPackages = with pkgs; [
    wtype
    kanata
  ];
  hardware.uinput.enable = true;
  users.groups.uinput.members = localUsers;
  users.groups.input.members = localUsers;
}
