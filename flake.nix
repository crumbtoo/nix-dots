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
      homeConfigurations = {
        crumble = import ./users/crumble/home.nix flakeContext;
      };

      homeManagerModules = import ./modules/home-manager;
    };
}
