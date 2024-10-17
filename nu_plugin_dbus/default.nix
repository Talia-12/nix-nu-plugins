{ lib
, pkgs
, fetchFromGitHub
, rustPlatform
}: let
  owner = "devyn";
  pname = "nu_plugin_dbus";
  version = "0.11.0";
in rustPlatform.buildRustPackage {
  inherit pname version;
  
  src = fetchFromGitHub {
    inherit owner;
    repo = pname;
    rev = version;
    hash = "sha256-pOgPlvsE8h/WtvLMcLz34hNlZQf60CCAavi+isV2jnU=";
  };

  cargoHash = "sha256-HoJDKqFO2kwCRl2+8DcovI9bIylQl3HfcAfatBIww1Q=";

  buildInputs = with pkgs; [
    dbus
  ];

  nativeBuildInputs = with pkgs; [
    pkg-config
  ]; 

  meta = {
    description = "A nushell plugin to interface with DBus.";
    mainProgram = "nu_plugin_dbus";
    homepage = "https://github.com/${owner}/${pname}";
    license = lib.licenses.mit;
    maintainers = [];
  };
}
