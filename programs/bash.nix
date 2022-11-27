{ pkgs }:

{
  enable = true;
  bashrcExtra = 
  ''
    PS1="\[\e[1;32m\][\t]: \w $\[\e[m\] "
  '';
  shellAliases = {
    la="ll -a";
    ".."="cd ..";
    "..."=".. && ..";
    "...."="... && ..";
    c="clear";
    switch="home-manager switch --flake ~/.config/home-manager#mrtn";
  };
}
