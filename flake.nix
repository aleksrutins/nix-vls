{
  description = "vala-language-server without a Linux dependency";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        packages = flake-utils.lib.flattenTree {
          default =
            import ./vala-language-server.nix { pkgs = pkgs; };
        };
      }
    );
}
