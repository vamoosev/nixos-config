{
  description = "Vamoosev systemconfig";
  inputs = {
	nixpkgs.url = "nixpkgs/nixos-unstable";
	home-manager.url = "github:nix-community/home-manager/master";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { nixpkgs, home-manager, ...}: 
  let 
     system = "x86_64-linux";

  	
     pkgs = import nixpkgs {
	inherit system;
	config = { allowUnfree = true; };
     };
     lib = nixpkgs.lib;
  
  in {
	nixosConfigurations = {
		AarniLoota = lib.nixosSystem {
			inherit system;
			modules = [
				./system/AarniLoota.nix	
			];
		};
 RMSFuckYou = lib.nixosSystem {
       inherit system;
       modules = [
        ./system/RMSFuckYou-configuration.nix
       ];

 };
  cgit = lib.nixosSystem {
		inherit system;
		modules = [
			./system/cgit.nix
		];
  };
	};
  
  	hmConfig = {
		aarni = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [
				./home-manager/home.nix
			];
			};
		};
	};
  }
