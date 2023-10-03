{pkgs, config, lib, modulesPath, ...}:

{
  imports = [
    ./common.nix
  (modulesPath + "/profiles/qemu-guest.nix")

     (builtins.fetchTarball {
      # Pick a release version you are interested in and set its hash, e.g.
      url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/nixos-23.05/nixos-mailserver-nixos-23.05.tar.gz";
      # To get the sha256 of the nixos-mailserver tarball, we can use the nix-prefetch-url command:
      # release="nixos-23.05"; nix-prefetch-url "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/${release}/nixos-mailserver-${release}.tar.gz" --unpack
      sha256 = "0000000000000000000000000000000000000000000000000000";
    })
  ];
  boot.initrd.availableKernelModules = [ "ata_piix" "virtio_pci" "virtio_scsi" "xhci_pci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/sda2";
      fsType = "btrfs";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/sda1";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.ens3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  networking.hostName = "itmestarit";
   users.users.otto = {
        isNormalUser = true;
        description = "aarni";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
        packages =  with pkgs; [
      eza
      fd
      file
      fzf
      starship
      zip
      unzip
      tldr
      ripgrep
      thefuck
      man-pages
      nix-index
      bat
      wget
      xz
      curl
      usbutils
      gitAndTools.tig
      bat
      htop
        ];
      };
    users.users.axel = {
        isNormalUser = true;
        description = "aarni";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
        packages =  with pkgs; [
      eza
      fd
      file
      fzf
      starship
      zip
      unzip
      tldr
      ripgrep
      thefuck
      man-pages
      nix-index
      bat
      wget
      xz
      curl
      usbutils
      gitAndTools.tig
      bat
      htop
        ];
      };
    services.nginx.enable = true;
    services.nginx.virtualHosts."itmestarit.fi" = {
      addSSL=true;
      enableACME=true;
      root = "/var/www/itmestarit.fi/";
    };
    services.nginx.virtualHosts."vw.itmestarit.fi" = {
      addSSL=true;
      enableACME=true;
      locations."/" = {
        proxyPass = "htts://62.78.210.249";
        proxyWebsockets = true;
      };
    };
    mailserver = {
      enable = true;
      fqdn = "mail.itmestarit.fi";
      domains = [ "itmestarit.fi" ];
      loginAccounts = {
        "aarni@itmestarit.fi" = {
          hashedPasswordFile = ./aarni-hash;
        };
      };


    };
    security.acme = {
      acceptTerms = true;
      email="mestarit@ksyk.fi";
    };

}
