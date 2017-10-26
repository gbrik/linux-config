{ config, pkgs, ... }:

{
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

}
