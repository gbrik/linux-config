{ config, pkgs, ... }:

let
  common = import ./common.nix { inherit config pkgs; };
in
{
  containers.tensorflow = {
    config =
      { config, pkgs, ... }:
      {
        environment.systemPackages = with pkgs; common.corePkgs ++ [
          (python35.withPackages(ps: with ps; [Keras tensorflow tflearn numpy pip wheel]))
        ];

        services.openssh.enable = true;
        services.openssh.permitRootLogin = "yes";

        users.extraUsers = { gbrik = common.gbrik; };
      };

    autoStart = false;

    privateNetwork = true;
    hostAddress = "192.168.100.10";
    localAddress = "192.168.100.11";
  };

  networking.extraHosts = config.containers.tensorflow.localAddress + " tf";
}
