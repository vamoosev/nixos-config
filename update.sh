pushd ~/.config/nixos/
	sudo nixos-rebuild switch --flake .#
	nix build .#hmConfig.aarni.activationPackage
	./result/activate
popd
