{ config, pkgs, ... }:

{
  programs = {
    zsh.enable = true;
  };

  users = {
    mutableUsers = true;
    defaultUserShell = pkgs.zsh;

    users.crumb = {
      description = "crumb";
      isNormalUser = true;
      home = "/home/crumb";

      extraGroups = [ "wheel" ];
    };
  };
}

