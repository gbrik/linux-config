{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    firefox plasma-pa zlib zlib.dev tdesktop chromium zip lmodern
    ghc stack gcc-unwrapped patchelf qbittorrent vlc pandoc texlive.combined.scheme-medium
  ];

  # List services that you want to enable:
  services.emacs = {
    enable = true;
    defaultEditor = true;
  };
  fonts.fonts = [ pkgs.source-code-pro ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers = {
    gbrik.extraGroups = [ "networkmanager" ];

    guest = {
      isNormalUser = true;
      uid = 1001;
      extraGroups = [ "networkmanager" ];
    };
  };

}
