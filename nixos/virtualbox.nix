# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports = [ ];

  networking.interfaces.enp0s8.ip4 = [ { address = "192.168.56.101"; prefixLength = 24; } ];
  services.openssh.permitRootLogin = "yes";
  boot.initrd.checkJournalingFS = false;
}