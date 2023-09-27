{pkgs, lib, ...}:

{
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


}
