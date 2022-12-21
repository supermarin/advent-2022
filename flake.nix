{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        gems = with pkgs; bundlerEnv {
          name = "advent-2022";
          inherit ruby_3_1;
          gemdir = ./.;
          groups = [ "default" "development" ];
        };
        deps = with pkgs; [
          bundix
          fish
          gems
          ruby_3_1
          rubyPackages_3_1.msgpack
          msgpack
        ];
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = deps;
          shellHook = "SHELL=$(which fish) exec fish";
        };
      });
}
