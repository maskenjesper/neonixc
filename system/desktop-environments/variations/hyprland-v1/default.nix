{ pkgs, ... }: {
  imports = [
    ../../window-managers/hyprland
    ../../system-utils/stylix
    ../../system-utils/audio
    ../../system-utils/printing
    ../../system-utils/bluetooth
    ../../system-utils/disks
    ../../shells/quickshell
    ../../../apps/dolphin
  ];
}
