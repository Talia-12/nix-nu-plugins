{ lib
, fetchFromGitHub
, rustPlatform
}: let
  owner = "FMotalleb";
  pname = "nu_plugin_clipboard";
  version = "571e0b76e25f7269fdbf4f992a21030e7ea1fe27";
in rustPlatform.buildRustPackage {
  inherit pname version;
  
  src = fetchFromGitHub {
    inherit owner;
    repo = pname;
    rev = version;
    hash = "sha256-+iZ/p24fnM5TuVY5H+OuoPj/O1YMJ1UnJt3LMpEHxL0=";
  };

  cargoHash = "sha256-CQ+D/WmHdGAkQnygjfm7DnI1k3mreuKyCwKnBqSN9r0=";

  meta = {
    description = "A nushell plugin to interface with the clipboard.";
    mainProgram = "nu_plugin_clipboard";
    homepage = "https://github.com/${owner}/${pname}";
    license = lib.licenses.mit;
    maintainers = [];
  };
}
