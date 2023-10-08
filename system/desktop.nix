{ config, pkgs, users, ...}:
{
 imports = [
	./common.nix
 ];
 services.xserver = {
    layout = "fi";
    xkbVariant = "";
  };
  services.pipewire = {
  	enable = true;
  	alsa.enable = true;
  	alsa.support32Bit = true;
  	pulse.enable = true;
  	# If you want to use JACK applications, uncomment this
  	#jack.enable = true;
  };
  users.users.aarni.packages = with pkgs; [ 
  cinnamon.nemo-with-extensions
  gnome3.adwaita-icon-theme 
	pavucontrol
  firefox
	(pkgs.discord.override {
  	withOpenASAR = false; 
  	withVencord = true;
        nss = nss_latest;
	}) 
  rnix-lsp
	xdg-utils
	sway
	ulauncher
	starship
	mako
	clipman
  neomutt
  curl
  isync
  msmtp
  pass
  mutt-wizard
	swaybg
	slurp
	grim
	sway-contrib.grimshot
	thefuck
	wl-clipboard
  ];
  fonts.packages = with pkgs; [
	fira-code-nerdfont
];
 programs.sway = {
		enable = true;
  };

 

}
