{
  description = "A nix flake for local OCCT";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };
  outputs = { self, nixpkgs}:
    let systems = ["x86_64-linux" "aarch64-darwin"]; 
        forAllSystems = nixpkgs.lib.genAttrs systems;
     in {
        packages = forAllSystems (system: 
          let pkgs = nixpkgs.legacyPackages.${system};
              occt = pkgs.stdenv.mkDerivation {
                name = "OCCT";
                src = ./.;
                nativeBuildInputs = [
                  pkgs.cmake
                ];
                buildInputs = [
                  pkgs.tcl
                  pkgs.tk
									pkgs.freetype
									pkgs.fontconfig
									pkgs.expat
                  pkgs.libGL
                  pkgs.libGLU
                  pkgs.libxext
                  pkgs.libxi
                  pkgs.rapidjson
                ];
              };
          in {
            default = occt;
          }
        );
        devShells = forAllSystems(system: 
          let pkgs = nixpkgs.legacyPackages.${system};
          in {
            default = pkgs.mkShell {
              packages = [
                  pkgs.tcl
                  pkgs.tk
                  pkgs.libGL
                  pkgs.libGLU
                  pkgs.libxext
                  pkgs.libxi
                  pkgs.rapidjson
                  pkgs.cmake
                  pkgs.doxygen
              ];
            };
          }
        ); 
     };

}
