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
		texlive.combined.scheme-full
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
		openrgb
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
		swaybg
		eza
		fd
		file
		fzf
		xdg-utils
		glib
		htop
		mpv
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
	  programs.zathura = {
	  	enable = true;
		extraConfig = ''
		set selection-clipboard clipboard
		set window-title-basename "true"
		set selection-clipboard "clipboard"

		# Dracula color theme for Zathura
		# Swaps Foreground for Background to get a light version if the user prefers

		#
		# Dracula color theme
		#

		set notification-error-bg       "#ff5555" # Red
		set notification-error-fg       "#f8f8f2" # Foreground
		set notification-warning-bg     "#ffb86c" # Orange
		set notification-warning-fg     "#44475a" # Selection
		set notification-bg             "#282a36" # Background
		set notification-fg             "#f8f8f2" # Foreground

		set completion-bg               "#282a36" # Background
		set completion-fg               "#6272a4" # Comment
		set completion-group-bg         "#282a36" # Background
		set completion-group-fg         "#6272a4" # Comment
		set completion-highlight-bg     "#44475a" # Selection
		set completion-highlight-fg     "#f8f8f2" # Foreground

		set index-bg                    "#282a36" # Background
		set index-fg                    "#f8f8f2" # Foreground
		set index-active-bg             "#44475a" # Current Line
		set index-active-fg             "#f8f8f2" # Foreground

		set inputbar-bg                 "#282a36" # Background
		set inputbar-fg                 "#f8f8f2" # Foreground
		set statusbar-bg                "#282a36" # Background
		set statusbar-fg                "#f8f8f2" # Foreground

		set highlight-color             "#ffb86c" # Orange
		set highlight-active-color      "#ff79c6" # Pink

		set default-bg                  "#282a36" # Background
		set default-fg                  "#f8f8f2" # Foreground

		set render-loading              true
		set render-loading-fg           "#282a36" # Background
		set render-loading-bg           "#f8f8f2" # Foreground

		#
		# Recolor mode settings
		#

		set recolor-lightcolor          "#282a36" # Background
		set recolor-darkcolor           "#f8f8f2" # Foreground

		#
		# Startup options
		#
		set adjust-open width
		set recolor true
		'';
	  };
	  xdg.mimeApps.defaultApplications = {
		"application/pdf" = "zathura.desktop";
		"text/html" = "librewolf.desktop";
		"video/mp4" = "mpv";

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
		if [ "$(tty)" = "/dev/tty1" ] ; then
		    # Your environment variables
		    export QT_QPA_PLATFORM=wayland
		    export MOZ_ENABLE_WAYLAND=1
		    export MOZ_WEBRENDER=1
		    export XDG_SESSION_TYPE=wayland
		    export XDG_CURRENT_DESKTOP=sway
		    exec sway
		fi


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
	      { command = "mako &"; always=true; }
	      { command = "swaybg -i /home/aarni/.config/nixos/home-manager/wp.jpg -m fill &"; always=true; }
	      ];
	      keybindings = lib.mkOptionDefault {
		"${modifier}+Shift+s" = "exec grimshot copy area";
	      };
	  };
	 };
	  # Let Home Manager install andmanage itself.
	  programs.home-manager.enable = true;
	}
