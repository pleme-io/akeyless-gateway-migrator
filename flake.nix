{
  description = "CLI tool to migrate configuration between Akeyless Gateway clusters";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, substrate, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkGoTool = (import "${substrate}/lib/go-tool.nix").mkGoTool;
    in {
      packages.default = mkGoTool pkgs {
        pname = "akeyless-gateway-migrator";
        version = "0.0.0-dev";
        src = self;
        vendorHash = "sha256-E49fPxp844OnTwSJSLnhNG5lu0W9UB8I1Wq8hE+1fo8=";
        description = "CLI tool to migrate configuration between Akeyless Gateway clusters";
        homepage = "https://github.com/pleme-io/akeyless-gateway-migrator";
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ go gopls gotools ];
      };
    });
}
