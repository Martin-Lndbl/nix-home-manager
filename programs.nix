{ config, pkgs, ... }:
{
  home-manager.enable = true;

#  neovim = import ./programs/neovim.nix {
#    inherit pkgs;
#  };

  git = import ./programs/git.nix {
    inherit pkgs;
  };

  termite = import ./programs/termite.nix {
    inherit pkgs;
  };

  bash = import ./programs/bash.nix {
    inherit pkgs;
  };
}
