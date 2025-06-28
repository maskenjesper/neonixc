
{ pkgs, ... }: { 
  imports = [
    ./hardware-configuration.nix 

    ../../system/common
    ../../system/services/syncthing
  ];

  networking.hostName = "rpi"; # Define your hostname.

  syncthing = {
      devices = {
        "phone" = { id = "3Y7HXLU-57OAFNZ-MO5PJ2T-PY7MOPA-U6RHHGF-4BUQEGX-7JRNZBZ-Q4CAAAP"; };
        "tellus" = { id = "ZELKS73-WQJMZM2-OZTBCWS-3COEL64-MXZZLD6-ZXCAYFG-GFSIMEC-576XCAG"; };
      };
      passwords = [ "phone" "tellus" ];
      second-brain = [ "phone" "tellus" ];
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
