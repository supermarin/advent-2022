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
          ruby_3_1
          rubyPackages_3_1.pry-byebug
          rubyPackages_3_1.pry-doc
          rubyPackages_3_1.solargraph
        ];
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = deps;
          shellHook = "exec fish";
        };
      });
}
