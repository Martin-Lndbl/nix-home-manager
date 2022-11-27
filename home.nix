{ config, lib, pkgs, ... }:

{
  home.username = "mrtn";
  home.homeDirectory = "/home/mrtn";

  home.stateVersion = "22.05";

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem(builtins.parseDrvName (pkg.pname or pkg.name)).name [
    "google-chrome"
    ];

  home.packages = with pkgs; [
    google-chrome
    calc
    universal-ctags
    fd
	whatsapp-for-linux
  ];

  xsession.windowManager.i3 = {
	enable = true;
    extraConfig = builtins.readFile ./i3/config;
  };

  programs = import ./programs.nix {
    inherit pkgs config;
  };
}
