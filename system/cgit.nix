{pkgs, lib, config, option, modulesPath, disko, ...}:
{
	






	imports = [
		(modulesPath + "/profiles/qemu-guest.nix")
		./common.nix
		];
		boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod" ];
		networking.useDHCP = lib.mkDefault true;
		nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";


	networking.hostName = "cgit";
	
#  disko.devices = {
#    disk = {
#      vdb = {
#        device = "/dev/sda";
#        type = "disk";
#        content = {
#          type = "gpt";
#          partitions = {
#            ESP = {
#              type = "EF00";
#              size = "500M";
#              content = {
#                type = "filesystem";
#                format = "vfat";
#                mountpoint = "/boot";
#              };
#            };
#            root = {
#              size = "100%";
#              content = {
#                type = "filesystem";
#                format = "ext4";
#                mountpoint = "/";
#              };
#            };
#          };
#        };
#      };
#    };
#  };

	services.nginx.gitweb.enable = true;
	services.gitweb = {
		projectroot = "/var/lib/git";
	};
}
