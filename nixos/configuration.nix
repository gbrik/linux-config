{ config, pkgs, ... }:

let
  common = import ./common.nix { inherit config pkgs; };
in
{
  imports =
    [
      ./hardware-configuration.nix
      ./tensorflow.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "gbrik-nixos"; # Define your hostname.
    wireless.enable = pkgs.lib.mkForce false;  # Enables wireless support via wpa_supplicant.
    networkmanager = {
      enable = true;
      unmanaged = [ "interface-name:ve-*" ];
    };
  };

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "US/Pacific";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; common.corePkgs ++ [
    firefox plasma-pa zlib zlib.dev tdesktop chromium zip
    ghc stack gcc-unwrapped patchelf qbittorrent vlc pandoc texlive.combined.scheme-medium lmodern
  ];

  # List services that you want to enable:

  services.emacs = {
    enable = true;
    defaultEditor = true;
  };
  fonts.fonts = [ pkgs.source-code-pro ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    displayManager.sddm.enable = true;

    desktopManager.plasma5 = {
      enable = true;
    };

    synaptics = {
      enable = true;
      twoFingerScroll = true;
    };
  };

  sound = {
    enable = true;
    mediaKeys = {
      enable = true;
      volumeStep = "5%";
    };
  };

  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers = {
    gbrik = common.gbrik // { extraGroups = common.gbrik.extraGroups ++ [ "networkmanager" ]; };

    guest = {
      isNormalUser = true;
      uid = 1001;
      extraGroups = [ "networkmanager" ];
    };
  };

  networking.nat = {
    enable = true;
    internalInterfaces = ["ve-+"];
    externalInterface = "wlp2s0";
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
