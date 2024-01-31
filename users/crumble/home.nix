{ inputs, ... }@flakeContext:
let
  homeModule = { config, lib, pkgs, ... }: {
    config = {
      home = {
        stateVersion = "23.11";
      };
    };
  };
  nixosModule = { ... }: {
    home-manager.users.crumble = homeModule;
  };
in
(
  (
    inputs.home-manager.lib.homeManagerConfiguration {
      modules = [
        homeModule
      ];
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-darwin;
    }
  ) // { inherit nixosModule; }
)

