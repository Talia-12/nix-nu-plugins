{ lib
, pkgs
, fetchFromGitHub
, rustPlatform
}: let
  owner = "devyn";
  pname = "nu_plugin_dbus";
  version = "eabf21dd6fa9aeef4dca4d316deb30d96fea90fc";
in rustPlatform.buildRustPackage {
  inherit pname version;
  
  src = fetchFromGitHub {
    inherit owner;
    repo = pname;
    rev = version;
    hash = "sha256-XVLX0tCgpf5Vfr00kbQZPWMolzHpkMVYKoBHYylpz48=";
  };

  cargoHash = "sha256-KIVZ74Fkj7qGRoetN9rOdx/ByqhmG9qKTnvFdfKctoM=";

  buildInputs = with pkgs; [
    dbus
  ];

  nativeBuildInputs = with pkgs; [
    pkg-config
  ]; 

  meta = {
    description = "A nushell plugin to interface with DBus.";
    homepage = "https://github.com/${owner}/${pname}";
    license = lib.licenses.mit;
    maintainers = [];
  };
}
