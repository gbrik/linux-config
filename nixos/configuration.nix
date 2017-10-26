{ config, pkgs, ... }:

let
  common = import gbrik/common.nix { inherit config pkgs; };
in
{
  imports =
    [
    ./hardware-configuration.nix

    #gbrik/plasma.nix
    #gbrik/virtualbox.nix
    #gbrik/tensorflow.nix
    ];

  users.extraUsers.gbrik = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" ];
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.grub.device = "/dev/sda";

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ git vim wget nix-repl gnumake ];

  # Set your time zone.
  time.timeZone = "US/Eastern";

  networking = {
    hostName = "gbrik-nixos"; # Define your hostname.
    wireless.enable = pkgs.lib.mkForce false;  # Enables wireless support via wpa_supplicant.
    networkmanager = {
      enable = true;
      unmanaged = [ "interface-name:ve-*" ];
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  networking.nat = {
    enable = true;
    internalInterfaces = ["ve-+"];
    externalInterface = "wlp2s0";
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
