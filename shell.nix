with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "openapi";
  buildInputs = [
    nodejs-14_x
    (yarn.override { nodejs = nodejs-14_x; })
    nodePackages.redoc-cli
  ];
  shellHook = ''
    redoc-cli bundle -o docs/index.html openapi.yaml
  '';
}
