{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";

    nix-darwin = {
      url = "flake:nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "flake:home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      flakeContext = {
        inherit inputs;
      };
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [ 
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default
          {
            nixpkgs.overlays = [
              inputs.nixpkgs-f2k.overlays.window-managers
            ];
          }
        ];
      };

      darwinConfigurations = {
        fruitbook = import ./hosts/fruitbook/configuration.nix flakeContext;
      };

      homeConfigurations.crumble =
        let
          homeModule = { config, lib, pkgs, ... }@args: {
            config = import ./users/crumble/home.nix args;
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
        );

      homeManagerModules = import ./modules/home-manager;
    };
}

