{pkgs, lib, ...}:

{
	imports = [
		./common.nix
		"${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
		];
	networking.hostName = "cgit";
	disco.devices = {
		disk = {
			main = {
				type = "disk";
				device = "/dev/sda";
				content = {
					type = "gpt";
					partitions = {
						boot = {
							type = "efi";
							size = 512;
							format = "vfat";
							mountPoint = "/boot";
						};
						root = {
							type = "linux";
							size = "100%";
							format = "ext4";
							mountPoint = "/";
						};
					};
					};
				};
			};

		};
	services.cgit = {
		enable = true;
		domain = "cgit.localhost";
		authorizedKeys = [
		 "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICNS7QxGjuCRj+j9zfcXRtXrD4JtCI7zkUuzyZTfhOAL"
		];
		mirrors = [
			{
				name = "nixos-config";
				url = "https://github.com/vamoosev/nixos-config";
			}
		];

	};
	
}
