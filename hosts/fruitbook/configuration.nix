{ inputs, ... }@flakeContext:
let
  darwinModule = { config, lib, pkgs, ... }: {
    imports = [
      inputs.home-manager.darwinModules.home-manager
      inputs.self.homeConfigurations.crumble.nixosModule
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
    ];
    config = {
      documentation = {
        enable = false;
      };
      programs = {
        bash = {
          enable = true;
        };
      };
      services = {
        dnsmasq = {
          addresses = {
            xkcd = "151.101.192.67";
          };
          enable = true;
        };
        nix-daemon = {
          enable = true;
        };
      };
      system = {
        stateVersion = 4;
      };
    };
  };
in
inputs.nix-darwin.lib.darwinSystem {
  modules = [
    darwinModule
  ];
  system = "x86_64-darwin";
}

