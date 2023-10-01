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


	 programs.kitty = {
		enable = true;
		font.name = "Fira Code Nerd Font";
		font.size = 12;
		settings = {
			scrollbackLines = 10000;
			shellIntegration = "zsh";


		};
		extraConfig = ''
			
cursor                  #928374
cursor_text_color       background

url_color               #83a598

visual_bell_color       #8ec07c
bell_border_color       #8ec07c

active_border_color     #d3869b
inactive_border_color   #665c54

foreground              #ebdbb2
background              #282828
selection_foreground    #928374
selection_background    #ebdbb2

active_tab_foreground   #fbf1c7
active_tab_background   #665c54
inactive_tab_foreground #a89984
inactive_tab_background #3c3836

# black  (bg3/bg4)
color0                  #665c54
color8                  #7c6f64

# red
color1                  #cc241d
color9                  #fb4934

#: green
color2                  #98971a
color10                 #b8bb26

# yellow
color3                  #d79921
color11                 #fabd2f

# blue
color4                  #458588
color12                 #83a598

# purple
color5                  #b16286
color13                 #d3869b

# aqua
color6                  #689d6a
color14                 #8ec07c

# white (fg4/fg3)
color7                  #a89984
color15                 #bdae93





		'';
	   };
	   
	  programs.fzf = {
	    enable = true;
	    enableZshIntegration = true;
	  };
}
