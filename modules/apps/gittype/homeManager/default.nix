{
  inputs,
  config,
  lib,
  ...
}: {
  home.packages = [
    inputs.gittype.packages.default
  ];
}
