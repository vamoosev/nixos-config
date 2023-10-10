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

      sha256 = "sha256:1ngil2shzkf61qxiqw11awyl81cr7ks2kv3r3k243zz7v2xakm5c";

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

  fileSystems."/boot" =
    { device = "/dev/sda1";
      fsType = "ext2";

    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.ens3.useDHCP = lib.mkDefault true;


  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

   boot.loader.grub = {
    enable = true;
    efiSupport = lib.mkForce false;
    devices = lib.mkForce [ "/dev/sda" ];
  };

  networking.hostName = "itmestarit";
   users.users.otto = {
        isNormalUser = true;
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
    networking.firewall.enable = false;
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
        proxyPass = "http://62.78.210.249:443";
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
