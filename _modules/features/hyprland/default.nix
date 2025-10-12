{config, pkgs, ...}: {

    flake.imports = [

    ];

    flake.modules = {

        nixos.hyprland = {
          #programs.uwsm = {
          #  enable = true;
          #  waylandCompositors.hyprland = {
          #    binPath = "/run/current-system/sw/bin/Hyprland";
          #    comment = "Hyprland session managed by uwsm";
          #    prettyName = "Hyprland";
          #  };
          #};
          programs.hyprland = {
            enable = true;
            xwayland.enable = true;
            withUWSM = true;
          };
          environment.sessionVariables = {
            WLR_NO_HARDWARE_CURSORS = "1";
            NIXOS_OZONE_WL = "1";
          };

          systemd.services.display-manager.enable = false;

          #  services.displayManager.sddm = {
          #      enable = true;
          #      wayland.enable = true;
          #  };

          services.xserver.enable = true;
          services.displayManager.sddm.enable = true;
          services.displayManager.sddm.wayland.enable = true;
          #services.xserver.displayManager.sddm.theme = "where_is_my_sddm_theme";

          # Enable inter-application communication
          xdg.portal.enable = true;
          xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

          environment.systemPackages = with pkgs; [
            where-is-my-sddm-theme 


          ];

        };

        homeManager.hyprland = {
          imports = [
            ../common/waybar
            ../common/wofi
            ../common/stylix
            ../common/quickshell
          ];

          home.file.".config/hypr" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/user/desktop-environments/hyprland/dotfiles";
            recursive = true;
          };

          # Explicitly avoids conficts with uswm
          wayland.windowManager.hyprland.systemd.enable = false;

          home.packages = with pkgs; [


            networkmanagerapplet
            gucharmap
            alarm-clock-applet
            resources
            usbimager
            galculator

            hyprshot
            libsForQt5.qt5.qtquickcontrols2
            libsForQt5.qt5.qtgraphicaleffects
            waypaper
            swww
            swaybg
            # Notifications
            swaynotificationcenter
            libnotify # notification dep

            # Locking
            hyprlock

            hyprsunset
            hyprpolkitagent
            hyprpicker
            hypridle

            # Panel and widgets
            waybar

            # App launcher
            rofi-wayland

            # Clipboard management
            wl-clipboard
            cliphist

#####################
            # Disk usage analyzer
            baobab

            # Disks utitlity
            gnome-disk-utility
            udisks
            udisks2
            udiskie

            # Camera utility
            guvcview
          ];

        };

    };

}
