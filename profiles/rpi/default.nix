{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/base/nixos

    ../../modules/services/syncthing/nixos
  ];

  networking.hostName = "rpi"; # Define your hostname.

  syncthing = {
    devices = {
      "phone" = {id = "3Y7HXLU-57OAFNZ-MO5PJ2T-PY7MOPA-U6RHHGF-4BUQEGX-7JRNZBZ-Q4CAAAP";};
      "voyager" = {id = "NGB3ZV7-5TUJBHD-S4G55WQ-GB2IJKU-T27F57R-KYUUW6O-ABBPROL-WXS3WAW";};
      "jupiter" = {id = "OJSGLW5-KQGAFU7-P2QBGSB-43EFXKE-LTN6NKO-BWAGK2J-KMDS7QG-F3WENAA";};
    };
    passwords.devices = ["phone" "voyager" "jupiter"];
    second-brain.devices = ["phone" "voyager" "jupiter"];
  };

  systemd.services.display-manager.enable = false;

  nix.settings.download-buffer-size = 1048576000; # 1GB

  users.users.jakob = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "Jakob Olsson";
    extraGroups = ["networkmanager" "wheel"];
    packages = [
      pkgs.home-manager
    ];
  };
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    # Avoid adding packages here.
  ];

  system.stateVersion = "24.05";
}
