{ lib
, fetchFromGitHub
, rustPlatform
}: let
  owner = "fdncred";
  pname = "nu_plugin_regex";
  version = "0.7.0";
in rustPlatform.buildRustPackage {
  inherit pname version;
  
  src = fetchFromGitHub {
    inherit owner;
    repo = pname;
    rev = "v${version}";
    hash = "sha256-ku+7Ahw6ETAdf3uxiucarOr6BaQTAAH3bQ9tGbuH4BU=";
  };

  cargoHash = "sha256-MbpGYPOyD6r+V7mC4WV+LA7lyYDTJ85ZuPgjkk7xVBU=";
 
  meta = {
    description = "A nushell plugin to parse regular expressions.";
    mainProgram = "nu_plugin_regex";
    homepage = "https://github.com/${owner}/${pname}";
    license = lib.licenses.mit;
    maintainers = [];
  };
}
