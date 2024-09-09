{ lib
, fetchFromGitHub
, rustPlatform
}: let
  owner = "fdncred";
  pname = "nu_plugin_regex";
  version = "010d9fa3bac932714b8dcceada1b33299bb38df2";
in rustPlatform.buildRustPackage {
  inherit pname version;
  
  src = fetchFromGitHub {
    inherit owner;
    repo = pname;
    rev = version;
    hash = "sha256-7MnR8/lQzTYdOQa0XW3CGrj0Eu5dJ0m9MvxhrVvGIfY=";
  };

  # The below is to fix the plugin's use of a local dev copy of nushell as its nu dependency.
  cargoLock = let
    fixupLockFile = path: (builtins.readFile path);
  in {
    lockFileContents = fixupLockFile ./Cargo.lock;
  };

  postPatch = ''
    rm Cargo.lock Cargo.toml
    ln -s ${./Cargo.lock} Cargo.lock
    ln -s ${./Cargo.toml} Cargo.toml
    cat Cargo.toml
  '';
  
  meta = {
    description = "A nushell plugin to parse regular expressions.";
    homepage = "https://github.com/${owner}/${pname}";
    license = lib.licenses.mit;
    maintainers = [];
  };
}
