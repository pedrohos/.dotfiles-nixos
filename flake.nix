{
  description = "flake";

  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ...}@inputs: {
    nixosConfigurations = {
      nixos-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          ./nixosModules
        ];
      };

      nixos-rog = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/rog/configuration.nix
          home-manager.nixosModules.home-manager
          ./nixosModules
        ];
      };

      nixos-mac = nixpkgs-unstable.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "aarch64-linux";
        modules = [
          #/home/pedrohos/.dotfiles/hosts/mac/configuration.nix
          ./hosts/mac/configuration.nix
          home-manager.nixosModules.home-manager
          ./nixosModules
        ];
      };
    };
  };

}
