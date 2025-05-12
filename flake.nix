{
  description = "flake";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chromium-widevine = {
      url = "github:heywoodlh/flakes?dir=chromium-widevine"; 
      inputs.nixpkgs.follows = "nixpkgs";  # Ensure it uses the same nixpkgs
    };
  };
  
  outputs = { self, nixpkgs, nixpkgs-unstable, chromium-widevine, home-manager, ...}@inputs: let 
    pkgs-unstable = import nixpkgs-unstable {
      config.allowUnfree = true;
    };
    #chromium-widevine-pkg = import chromium-widevine;
    in {
    nixosConfigurations = {
      nixos-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
	  #chromium-widevine
          ./hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          ./nixosModules
        ];
      };

      nixos-rog = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
	  #chromium-widevine
          ./hosts/rog/configuration.nix
          home-manager.nixosModules.home-manager
          ./nixosModules
        ];
      };

      nixos-mac = nixpkgs-unstable.lib.nixosSystem rec {
        system = "aarch64-linux";
        specialArgs = {
          #inherit inputs;
          
          # Allow access to unstable packages
/*
          pkgs-unstable = import nixpkgs-unstable {
            config.allowUnfree = true;
          };
*/
        };
        modules = [
          ./hosts/mac/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = {
              inherit pkgs-unstable inputs chromium-widevine system;            
              chromium-widevine-pkg = chromium-widevine.packages.${system}.chromium-widevine;
            };
            # Home manager initial config
            home-manager.users.pedrohos = import /home/pedrohos/.dotfiles/home.nix;
          }
          ./nixosModules
        ];
      };
    };
  };

}
