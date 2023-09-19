#!/usr/bin/env perl 
$num_args = $#ARGV;
if ($num_args != 0) {
	print("söis");
	exit;
}

$arg = $ARGV[0];
if ($arg eq "update-all") {
	chdir("/home/aarni/.config/nixos");
	system("nix flake update --commit-lock-file");
	system("sudo nixos-rebuild switch --flake .#");
	system("nix build .#hmConfig.aarni.activationPackage");
	system("./result/activate");


}
elsif ($arg eq "update") {
	chdir("/home/aarni/.config/nixos");
	system("nix flake update --commit-lock-file");
	system("sudo nixos-rebuild switch --flake .#");
}
elsif ($arg eq "update-hm") {
	chdir("/home/aarni/.config/nixos");
	system("nix build .#hmConfig.aarni.activationPackage");
	system("./result/activate");
}

