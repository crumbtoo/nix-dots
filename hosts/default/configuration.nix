# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../shared/configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.x11 = true;

  networking.hostName = "crumbnix"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver = {
    enable = true;
    libinput = {
      enable = true;

      # disabling mouse acceleration
      mouse = {
        accelProfile = "flat";
      };

      # disabling touchpad acceleration
      touchpad = {
        accelProfile = "flat";
      };
    };

    displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome";
      # sessionCommands = ''
      #   xrandr --output Virtual1 --mode 2560x1440
      # '';
    };

    xrandrHeads = [
      {
        output = "Virtual1";
        primary = true;
        monitorConfig = ''Option "PreferredMode" "2560x1440"'';
      }
    ];

    windowManager.awesome = {
      enable = true;
    };
  };

  services.picom = {
    settings = {
      shadow = true;
      shadow-radius = 40;
      shadow-opacity = .55;
      shadow-offset-x = -40;
      shadow-offset-y = -20;
      shadow-exclude = [
        "_NET_WM_WINDOW_TYPE:a = '_NET_WM_WINDOW_TYPE_NOTIFICATION'"
        "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
        "_GTK_FRAME_EXTENTS@:c"
      ];
      shadow-ignore-shaped = false;
    };
    enable = true;
    # backend = "glx";
  };


  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    # awesome
    git
    gcc
    # inputs.nixpkgs-f2k.packages.${system}.awesome-luajit-git
    picom-next
  ];

  nixpkgs.overlays = [
    (_: _:
      {
        awesome = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-luajit-git;
      }
    )
  ];

  # nixpkgs.overlays = [
  #   (self: super: 
  #     { myAwesome = super.awesome.overrideAttrs (old: rec 
  #        { pname = "myAwesome"; 
  #           version = "git-20220614-3a54221"; 
  #           src = super.fetchFromGitHub {
  #             owner = "awesomeWM";
  #             repo = "awesome"; 
  #             rev = "e6f5c7980862b7c3ec6c50c643b15ff2249310cc"; 
  #             sha256 = "sha256-afviu5b86JDWd5F12Ag81JPTu9qbXi3fAlBp9tv58fI=";
  #            }; 
  #          patches = []; 
  #        }); 
  #     }
  #   )
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "crumb" = import ../../users/crumb/home.nix;
    };
  };
}

