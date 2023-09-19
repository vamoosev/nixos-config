{ config, pkgs, lib, ... }:
{
	  # Home Manager needs a bit of information about you and the paths it should
	  # manage.
	  home.username = "aarni";
	  home.homeDirectory = "/home/aarni";

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
	  home.packages = with pkgs; [
		ulauncher
		(lib.hiPrio gcc)
		(lib.lowPrio clang)
		bear
		mangohud
		gamemode
		binutils
		clang-tools
		cmake
		ctags
		joplin-desktop
		gdb
		gitAndTools.tig
		octaveFull
		git-quick-stats
		gnumake
	        clipman
		meson
		mako
		ninja
		patchelf
		luajit
		rr
		rustup
		quick-lint-js
		acpi
		eza
		fd
		file
		fzf
		zathura
		xdg-utils
		glib
		htop
		nix-index
		man-pages
		tectonic
		tldr
		unzip
		ripgrep
		wl-clipboard
		grim
		slurp
		zip
		thefuck
		element-desktop
		starship
	        sway-contrib.grimshot
	  ];

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
	   programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
		withNodeJs = true;
		withPython3 = true;
	   };
	  programs.i3status-rust = {
		enable = true;
		bars = {
			default= {
				blocks = [
					{
						block = "memory";
						format = " $mem_total_used_percents ";
					}
					{
						block = "cpu";
						interval = 1;
					}
					{
						block = "battery";

					}
					{
						block = "time";
						format = " $timestamp.datetime(f:'%a %d/%m %R') ";
						interval = 60;
					}
					];

			};

		};

	  };
	   xdg.configFile.nvim = {
  		source = ./nvimconf;
  		recursive = true;
           };
#	   xdg.mime.defaultApplications = {
#		  "text/html" = "net.librewolf.librewolf.desktop";
#		  "x-scheme-handler/http" = "net.librewolf.librewolf.desktop";
#		  "x-scheme-handler/https" = "net.librewolf.librewolf.desktop";
#		  "x-scheme-handler/about" = "net.librewolf.librewolf.desktop";
#		  "x-scheme-handler/unknown" = "net.librewolf.librewolf.desktop";
#	    };
#	   
	   programs.foot = {
		enable = true;
		settings = {
			  main = {
			    term = "xterm-256color";

			    font = "FiraCode Nerd Font:size=12";

			    dpi-aware = "yes";
			  };
		};

	   };
	   programs.zsh = {
	    enable = true;
	    autocd = true;
	    dotDir = ".config/zsh";
	    enableAutosuggestions = true;
	    enableCompletion = true;

	    shellAliases = {
	      sl = "eza";
	      ls = "eza";
	      l = "eza -l";
	      la = "exa -la";
	      ip = "ip --color=auto";
	      killall = "pkill";
	      edit-hm = "nvim ~/.config/nixos/home-manager/home.nix";
	      update-sys = "~/.config/nixos/update.perl";
	    };

	    initExtra = ''
		eval "$(starship init zsh)"



				'';

	  };

	  programs.fzf = {
	    enable = true;
	    enableZshIntegration = true;
	  };
	  programs.bat.enable = true;
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
	  wayland.windowManager.sway = {
	    enable = true;
	    config = rec {
	      modifier = "Mod4";
	      menu = "ulauncher";
	      bars = [
		{
			position = "top";
			fonts = {
				names = [ "FiraCode Nerd Font" ];
				style = "Regular";
				size = 12.0;
			};
			statusCommand = "i3status-rs ~/.config/i3status-rust/*";
		}

	      ];
	      window.commands = [
		{
			command = "border none";
			criteria = {
				title = "Ulauncher";
			};
		}
	      ];
	      input = { 
		"*" = {
			xkb_layout = "fi";
		};
	      };
	      output = {
		DP-3 = { pos = "1920 0"; };
		HDMI-A-1 = { pos = "0 0"; };
	      };
	      # Use kitty as default terminal
	      terminal = "foot";
	      startup = [
	      {command = "mako";}
	      {command = ''swaymsg output "*" bg ./wp.jpg fill'';}
	      ];
	      keybindings = lib.mkOptionDefault {
		"${modifier}+Shift+s" = "grimshot copy area";
	      };
	  };
	 };
	  # Let Home Manager install andmanage itself.
	  programs.home-manager.enable = true;
	}
