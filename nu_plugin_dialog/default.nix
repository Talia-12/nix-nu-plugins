{ lib
, fetchFromGitHub
, rustPlatform
}: let
  owner = "Trivernis";
  pname = "nu-plugin-dialog";
  version = "850310803eb7c9a4865ac6836f519f01c62b12b5";
in rustPlatform.buildRustPackage {
  inherit pname version;
  
  src = fetchFromGitHub {
    inherit owner;
    repo = pname;
    rev = version;
    hash = "sha256-/KWEyVqXWgJfGIgFqXIBUqzA89FB/XDzn9aciknWApM=";
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
    description = "A nushell plugin to accept user input.";
    homepage = "https://github.com/${owner}/${pname}";
    license = {
      fullName = "Cooperative Non-Violent Public License v4";
      url = "https://scancode-licensedb.aboutcode.org/cooperative-non-violent-4.0.html";
    };
    maintainers = [];
  };
}
