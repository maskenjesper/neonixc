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
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
        ];
        extraDefCfg = ''
          process-unmapped-keys yes
          concurrent-tap-hold yes
        '';
        config = ''

          (defsrc
            esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
            caps a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt rmet rctl
          )

          (defvar
            ;; Timing parameters
            tap-timeout 200
            hold-timeout 200  ;; Reduced for faster mod activation

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
            tab (tap-hold $tap-timeout $hold-timeout tab (layer-toggle arrow))
            ;; del del  ;; Alias for the true delete key action

            ;; Left hand homerow mods
            a (tap-hold-release-keys $tap-timeout $hold-timeout a lsft $left-hand-keys)
            s (tap-hold-release-keys $tap-timeout $hold-timeout s lalt $left-hand-keys)
            d (tap-hold-release-keys $tap-timeout $hold-timeout d lmet $left-hand-keys)
            f (tap-hold-release-keys $tap-timeout $hold-timeout f lctl $left-hand-keys)

            ;; Right hand homerow mods (matching pairs)
            j (tap-hold-release-keys $tap-timeout $hold-timeout j rctl $right-hand-keys)
            k (tap-hold-release-keys $tap-timeout $hold-timeout k rmet $right-hand-keys)
            l (tap-hold-release-keys $tap-timeout $hold-timeout l ralt $right-hand-keys)
            ; (tap-hold-release-keys $tap-timeout $hold-timeout ; rsft $right-hand-keys)

            ;; Left Alt key: tap for alt, hold for symbols layer
            sym (tap-hold 200 200 spc (layer-while-held symbols))
          )

          (deflayer base
            esc   f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
            XX    XX   XX   XX   XX   XX   XX   XX   XX   XX   XX   XX   XX   bspc
            tab   q    w    e    r    t    y    u    i    o    p    XX   XX   XX
            @caps @a   @s   @d   @f   g    h    @j   @k   @l   @;   '    XX
            XX    z    x    c    v    b    n    m    ,    .    /    XX
            XX    XX   @tab           @sym           ret  XX   XX
          )

          (deflayer symbols
            esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
            _    _     _    _    _    _    _    _    _    _    _    _    _    _
            _    S-1   S-2  [    ]    S-5  S-6  7    8    9    S-\  _    _    _
            grv  S-grv S--  S-9  S-0  =    S-7  4    5    6    0    S-4  _
            _    S-3   -    S-[  S-]  S-=  S-8  1    2    3    \    _
            _    _     _              _              _    _    _
          )

          (deflayer arrow
            esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
            _    _    _    _    _    _    _    _    _    _     _    _    _    _
            _    _    _    _    _    _    _    _    _    _     _    _    _    _
            _    _    _    _    _    _    left down up   right _    _    _
            _    _    _    _    _    _    _    _    _    _     _    _
            _    _    _              _              _    _     _
          )
        '';
      };
    };
  };
}
