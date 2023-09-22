{nixpkgs, nixvim, ...}:
let
  pkgs = import nixpkgs {};
  nixvim = import nixvim { inherit pkgs; };
in
 {
  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;
    plugins.lightline.enable = true;
  };
}
