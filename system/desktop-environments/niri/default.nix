{ pkgs, ... }: {
  imports = [
    ./submodules/stylix
    ./submodules/audio
    ./submodules/printing
    ./submodules/bluetooth
    ./submodules/disks
    ../../apps/dolphin
  ];

  programs.niri = {
      enable = true;
  };

  # Enable inter-application communication
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  environment.systemPackages = with pkgs; [
    


  ];
}
