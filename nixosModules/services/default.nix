{ config, lib, pkgs, home-manager, ... }:
{
  imports = [
    ./audio.nix
    ./keyring.nix
    ./neo4j.nix
    ./network.nix
    ./printing.nix
  ];
}
