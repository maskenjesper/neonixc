{
  config,
  ...
}:
{
  flake.modules.nixos."hosts/jupiter".imports =
    with config.flake.modules.nixos;
    [
      # Modules
      base
      hyprland
      _1password
      teamviewer
      adb
      gaming 
      virtualization
      appimage
      stess_and_bench
      keymap
      xremap
      amd-gpu
      syncthing
      openrgb

      # Users
      jakob
    ]
    # Specific Home-Manager modules
    ++ [
      {
        home-manager.users.jakob.imports = with config.flake.modules.homeManager; [
          base
          desktop
          dev
          facter
          shell
          thunderbird
        ];
      }
    ];
}
