{ inputs, ... }@flakeContext:
let
  homeModule = { config, lib, pkgs, ... }: {
    config = {
      home = {
        homeDirectory = lib.mkForce "/Users/crumble";
        stateVersion = "23.11";
      };

      xdg.configFile = {
        "nvim".source = config.lib.file.mkOutOfStoreSymlink
          /Users/crumble/nix/configs/nvim;
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

