{
  lib,
  config,
  ...
}: {
  options = {
    evalClass = lib.mkOption {type = lib.types.enum ["nixos" "homeManager"];};
  };

  imports =
    []
    ++ (
      if config.evalClass == "nixos"
      then [./nixos]
      else [./homeManager]
    );
}
