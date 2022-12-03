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

	"1s"="cd ~/D/docs/uni/01_sem";
	"2s"="cd ~/D/docs/uni/02_sem";
	"3s"="cd ~/D/docs/uni/03_sem";

	"ITsecBox"="ssh team-116@sandkasten.sec.in.tum.de";
  };
}
