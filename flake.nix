{
  description = " A nushell plugin to add commands for working with regex. ";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    systems.url = "github:nix-systems/default-linux";
  };
  outputs = {
    self,
    nixpkgs,
    systems,
  }: let
    forAllSystems = nixpkgs.lib.genAttrs (import systems);
    pkgsFor = nixpkgs.legacyPackages;
  in {
    packages = forAllSystems (system: {
      regex = pkgsFor.${system}.callPackage ./nu_plugin_regex {};
    });
    devShells = forAllSystems (system: {
      regex = pkgsFor.${system}.callPackage ./nu_plugin_regex/shell.nix {};
    });
  };
}
