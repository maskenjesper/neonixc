
{pkgs, config, ...}: {

  environment.systemPackages = with pkgs; [
        clinfo
        lact
    ];

    boot.initrd.kernelModules = [ "amdgpu" ];

    services.xserver = {
        videoDrivers = ["amdgpu"];
        enable = true;
    };

    systemd = {
        tmpfiles.rules = [
            "L+    /opt/rocm/hip   -   -   -   -   ${pkgs.rocmPackages.clr}"
        ];
        packages = with pkgs; [ lact ];
        services.lactd.wantedBy = [ "multi-user.target" ];
    };
    
    hardware.graphics = {
        extraPackages = with pkgs; [
            rocmPackages.clr.icd
            # amdvlk
        ];
        extraPackages32 = with pkgs; [
            # driversi686Linux.amdvlk
        ];
        enable32Bit = true;
    };
}
