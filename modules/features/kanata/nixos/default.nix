{
  pkgs,
  inputs,
  localUsers,
  ...
}: {
  boot.kernelModules = ["uinput"];

  hardware.uinput.enable = true;

  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  users.groups.uinput.members = localUsers;
  users.groups.input.members = localUsers;

  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          # Replace the paths below with the appropriate device paths for your setup.
          # Use `ls /dev/input/by-path/` to find your keyboard devices.
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
           caps tab d h j k l
          )
          (defvar
           ;; Timing
           tap-time 200
           hold-time 150

           ;; Keys on same hand that trigger early tap
           ;; EXCLUDING homerow mod keys so they can combine smoothly
           left-hand-keys (
             q w e r t
             g  ;; excluding a s d f
             z x c v b
           )

           right-hand-keys (
             y u i o p
             h  ;; excluding j k l ;
             n m , . /
           )
          )
          (defalias
           caps (tap-hold 200 200 esc lctl)
           tab (tap-hold $tap-time $hold-time tab (layer-toggle arrow))
           del del  ;; Alias for the true delete key action
           a (tap-hold-release-keys $tap-time $hold-time a lctl $left-hand-keys)
           s (tap-hold-release-keys $tap-time $hold-time s lalt $left-hand-keys)
           d (tap-hold-release-keys $tap-time $hold-time d lmet $left-hand-keys)
           f (tap-hold-release-keys $tap-time $hold-time f lsft $left-hand-keys)

           ;; Right hand homerow mods (matching pairs)
           j (tap-hold-release-keys $tap-time $hold-time j rsft $right-hand-keys)
           k (tap-hold-release-keys $tap-time $hold-time k rmet $right-hand-keys)
           l (tap-hold-release-keys $tap-time $hold-time l ralt $right-hand-keys)
           ; (tap-hold-release-keys $tap-time $hold-time ; rctl $right-hand-keys)
          )
          (deflayer base
           @caps @tab d h j k l
          )
          (deflayer arrow
           _ _ @del left down up right
          )
        '';
      };
    };
  };
}
