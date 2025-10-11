{ inputs, ... }:
{
  # Enables the module system of flake-parts (flake.modules.<class>.<module>)
  imports = [ inputs.flake-parts.flakeModules.modules ];
}
