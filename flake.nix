{
  description = "Vamoosev systemconfig";
  inputs = {
	nixpkgs.url = "nixpkgs/nixos-unstable";
	home-manager.url = "github:nix-community/home-manager/master";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
	disko.url = "github:nix-community/disko";
	nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
	disko.inputs.nixpkgs.follows = "nixpkgs";
  };
	outputs = { nixpkgs, home-manager, disko, nix-doom-emacs, ...}: 
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
        ./system/RMSFuckYou.nix
       ];

 };
  cgit = lib.nixosSystem {
		inherit system;
		modules = [
			disko.nixosModules.disko

			./system/cgit.nix
		];
  };
	};
  
  	hmConfig = {
		aarni = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [
				./home-manager/home.nix
				nix-doom-emacs.hmModule
			];
			};
		};
	};
  }
