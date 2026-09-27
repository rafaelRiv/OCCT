{
  description = "A nix flake for local OCCT";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };
  outputs = { self, nixpkgs}:
    let system = "aarch64-darwin"; 
        pkgs = nixpkgs.legacyPackages.${system};
     in {
        packages.${system}.default = pkgs.hello;
     };
}
