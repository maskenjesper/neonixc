{pkgs, ...}: {

    environment.systemPackages = with pkgs; [
        nautilus
    ];

    services.gvfs.enable = true;

    nixpkgs.overlays = [
      (final: prev: {
        nautilus = prev.nautilus.overrideAttrs (nprev: {
          buildInputs =
            nprev.buildInputs
            ++ (with pkgs.gst_all_1; [
              gst-plugins-good
              gst-plugins-bad
            ]);
        });
      })
    ];

}
