{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      l = "ls -lha";
      v = "nvim";
      ":q" = "exit";
    };

    autocd = true;
    enableCompletion = true;
  };
}

