{pkgs, ...}: {

  environment.systemPackages = with pkgs; [
    geekbench_6
    phoronix-test-suite
    stress-ng
  ];

}
