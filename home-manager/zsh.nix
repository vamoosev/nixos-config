{
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
	      cat="bat";
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

		export PATH=$PATH:$HOME/.cargo/bin:$PATH
		source ~/export-esp.sh

				'';

	  };


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
	   
	  programs.fzf = {
	    enable = true;
	    enableZshIntegration = true;
	  };
}
