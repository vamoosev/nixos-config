# This script is used to update packages
#
#
# crash if any command fails also show command thats being run
set -e -x
if [ "$1" == "" ]; then
    printf "Usage: all to update home-manager and nixpkgs also update flake lock file\n      update-home to update home-manager\n       update-nixpkgs to update nixpkgs\n       update-flake to update flake lock file"
    printf "$1"
    exit 1



elif [ "$2" == "all" ]; then
	pushd ~/.config/nixos
   	nix flake update --commit-lock-file
	sudo nixos-rebuild --flake .#
	nix build .#hmConfig.aarni.activationPackage
	./result/activate
	exit 0
	popd


elif [ "$2" == "update-home" ]; then
	pushd ~/.config/nixos
	nix build .#hmConfig.aarni.activationPackage
	./result/activate
	exit 0
	popd


elif [ "$2" == "update-nixpkgs" ]; then
	pushd ~/.config/nixos
	sudo nixos-rebuild --flake .#
	exit 0
	popd


elif [ "$2" == "update-flake" ]; then
	pushd ~/.config/nixos
	nix flake update --commit-lock-file
	exit 0
	popd
fi

