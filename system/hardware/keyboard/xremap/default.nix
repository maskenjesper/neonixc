{
  pkgs,
  inputs,
  users,
  ...
}: {
  imports = [
    inputs.xremap.nixosModules.default
  ];

  services.xremap = {
    withWlroots = true;
    watch = true;
    yamlConfig = ''
      modmap:
        - name: main remaps
          remap:
            CapsLock:
              held: leftctrl
              alone: esc
              alone_timeout_millis: 250
            esc: CapsLock
    '';
  };
  environment.systemPackages = with pkgs; [
    wtype
  ];
  hardware.uinput.enable = true;
  users.groups.uinput.members = users;
  users.groups.input.members = users;
}
