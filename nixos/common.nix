{ config, pkgs, ... }:

{
  gbrik = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" ];
  };

  corePkgs = with pkgs; [ git vim wget nix-repl gnumake ];
}
