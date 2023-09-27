
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Bootloader.
  nix.extraOptions = ''
  	experimental-features = nix-command flakes
  '';
   boot.loader.efi = {
	canTouchEfiVariables = true;
	efiSysMountPoint = "/boot/efi";
  };
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Helsinki";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };


  # Configure console keymap
  console.keyMap = "fi";
  security.rtkit.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users.users.aarni = {
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
	wget
	xz
	curl
	usbutils
	gitAndTools.tig
	bat
	htop
    ];
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  programs.sway = {
		enable = true;
  };

  hardware.opengl.driSupport32Bit = true; 
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  security.polkit.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
  services.tailscale.enable = true;
}
