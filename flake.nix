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

  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "go";
    builder = "tool";
    pname = "akeyless-gateway-migrator";
    vendorHash = "sha256-E49fPxp844OnTwSJSLnhNG5lu0W9UB8I1Wq8hE+1fo8=";
    description = "CLI tool to migrate configuration between Akeyless Gateway clusters";
    homepage = "https://github.com/pleme-io/akeyless-gateway-migrator";
  };
}
