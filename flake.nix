{
  description = "Vincents nix/nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-23.05-darwin";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, darwin }:
    {
    darwinConfigurations.athens = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        home-manager.darwinModules.home-manager
        {
          nixpkgs.overlays = [
            (final: prev: {
              # Having to use the stable version, since unstable breaks
              # the current vs code extension
              direnv = (import nixpkgs-stable {
                system = "aarch64-darwin";
              }).direnv;
            })
          ] ;
        }
        ./hosts/athens/default.nix
      ];
    };
  };
}
