{ config, pkgs, lib, ... }:
{
	  # Home Manager needs a bit of information about you and the paths it should
	  # manage.
	  home.username = "aarni";
	  home.homeDirectory = "/home/aarni";
	  imports = [
		./zsh.nix
		./sway.nix
		./zathura.nix
		./nvim.nix
	  ];
	  # This value determines the Home Manager release that your configuration is
	  # compatible with. This helps avoid breakage when a new Home Manager release
	  # introduces backwards incompatible changes.
	  #
	  # You should not change this value, even if you update Home Manager. If you do
	  # want to update the value, then make sure to first check the Home Manager
	  # release notes.
	  home.stateVersion = "23.05"; # Please read the comment before changing.

	  # The home.packages option allows you to install Nix packages into your
	  # environment.

#	   programs.waybar = {
#		enable = true;
#		style = "./style.css";
#		settings = [
#			{
#			  "*" = {
#				layer = "top";
#				postition = "top";
#				height = 200;
#				modules-left = [ "sway/workspaces" ];
#				modules-center = [ "sway/window" ];
#				modules-right = [ "temprature"  "wireplumber" "cpu" "disk" "memory" "clock" "tray" ]; 
#
#			  };
#
#			
#			}
#		];
#	   };
	    
	  xdg.mimeApps.defaultApplications = {
		"application/pdf" = "zathura.desktop";
		"text/html" = "librewolf.desktop";
		"video/mp4" = "mpv";

	  };
	  	   
#	   xdg.mime.defaultApplications = {
#		  "text/html" = "net.librewolf.librewolf.desktop";
#		  "x-scheme-handler/http" = "net.librewolf.librewolf.desktop";
#		  "x-scheme-handler/https" = "net.librewolf.librewolf.desktop";
#		  "x-scheme-handler/about" = "net.librewolf.librewolf.desktop";
#		  "x-scheme-handler/unknown" = "net.librewolf.librewolf.desktop";
#	    };
#	   
	  
	  programs.git = {
		enable = true;
		package = pkgs.gitAndTools.gitFull;
		userEmail = "vamoosev@gmail.com";
		userName = "vamoosev";

		extraConfig = {
			core = { whitespace = "trailing-space,space-before-tab"; };
			color = { ui = "auto"; };
			merge = { ff = "only"; };
			rerere = { enabled = "true"; };
			rebase = { autoSquash = "true"; };
			github = { user = "vamoosev"; };
		};
	  };



	  # Home Manager is pretty good at managing dotfiles. The primary way to manage
	  # plain files is through 'home.file'.
	  home.file = {
	    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
	    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
	    # # symlink to the Nix store copy.
	    # ".screenrc".source = dotfiles/screenrc;

	    # # You can also set the file content immediately.
	    # ".gradle/gradle.properties".text = ''
	    #   org.gradle.console=verbose
	    #   org.gradle.daemon.idletimeout=3600000
	    # '';
	  };

	  # You can also manage environment variables but you will have to manually
	  # source
	  #
	  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
	  #
	  # or
	  #
	  #  /etc/profiles/per-user/aarni/etc/profile.d/hm-session-vars.sh
	  #
	  # if you don't want to manage your shell through Home Manager.
	  home.sessionVariables = {
	    EDITOR = "nvim";
	  };
	 	  # Let Home Manager install andmanage itself.
	  programs.home-manager.enable = true;
	}
