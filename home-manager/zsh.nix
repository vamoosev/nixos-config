{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      sl = "exa";
      ls = "exa";
      l = "exa -l";
      la = "exa -la";
      ip = "ip --color=auto";
    };

    initExtra = ''
  	eval "$(starship init zsh"



  			'';

  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}

