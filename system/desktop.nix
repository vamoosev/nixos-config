{ config, pkgs, ...}:
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
  neovim
  gnome3.adwaita-icon-theme 

  ];
  fonts.packages = with pkgs; [
	fira-code-nerdfont
];


 

}
