{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        deps = with pkgs; [
          fish
          ruby
          rubyPackages.pry
          rubyPackages.pry-doc
        ];
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = deps;
          shellHook = "exec fish";
        };
      });
}
