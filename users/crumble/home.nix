{ config, lib, pkgs, ... }:
{
  home = {
    homeDirectory = lib.mkForce "/Users/crumble";
    stateVersion = "23.11";
  };
  xdg.configFile = {
    "nvim".source = config.lib.file.mkOutOfStoreSymlink
      /Users/crumble/nix/configs/nvim;
  };
}

