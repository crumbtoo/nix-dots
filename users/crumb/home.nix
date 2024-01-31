{ config, pkgs, outputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "crumb";
  home.homeDirectory = "/home/crumb";

  imports = [
    (import ./programs/zsh)
  ];

  # ~/.config
  xdg.configFile = {
    # change these to use `mkOutOfStoreSymlink` for fast updates, e.g.
    #       "nvim".source = config.lib.file.mkOutOfStoreSymlink /home/crumb/nixos/dots/nvim-nfnl;

    # "awesome".source = ../../dots/awesome-kanagawa;
    # "nvim".source = ../../dots/nvim;
    "awesome".source = config.lib.file.mkOutOfStoreSymlink /home/crumb/nixos/users/crumb/config/awesome-kanagawa;
    "nvim".source = config.lib.file.mkOutOfStoreSymlink /home/crumb/nixos/users/crumb/config/nvim;
    "wezterm".source = config.lib.file.mkOutOfStoreSymlink /home/crumb/nixos/users/crumb/config/wezterm;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    neovim
    discord
    lazygit
    luajitPackages.fennel
    fira-code-nerdfont
    victor-mono
    wezterm

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

