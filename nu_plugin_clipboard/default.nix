{ lib
, fetchFromGitHub
, rustPlatform
}: let
  owner = "FMotalleb";
  pname = "nu_plugin_clipboard";
  version = "0.98.0";
in rustPlatform.buildRustPackage {
  inherit pname version;
  
  src = fetchFromGitHub {
    inherit owner;
    repo = pname;
    rev = version;
    hash = "sha256-/Oc57JaRlKZppJ9ZEKbSHb/8kg1XqziIQhpBB2uBT7c=";
  };

  cargoHash = "sha256-wR1mCHB+c483m4sPBNvT+NB9kqOVs3gUigETikBgG9Y=";

  meta = {
    description = "A nushell plugin to interface with the clipboard.";
    mainProgram = "nu_plugin_clipboard";
    homepage = "https://github.com/${owner}/${pname}";
    license = lib.licenses.mit;
    maintainers = [];
  };
}
