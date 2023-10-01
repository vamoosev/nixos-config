{pkgs, nix-doom-emacs, ...}:

{
	home.packages = with pkgs; [
		rust-analyzer
	];
	programs.doom-emacs = {
		enable = true;
		doomPrivateDir = ./doom.d;
	};

}
