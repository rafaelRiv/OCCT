{
  description = "A nix flake for local OCCT";
  input = {
    nixpkgs = "github:NixOS/nixpkgs/nix26.05";
  };
  output = { self, nixpkgs}:
    let system = "aarch64-darwin"; 
        pkgs = nixpkgs.legacyPackage.${system};
     in {
        packages.${system}.default = pkgs.hello;
     }
}
