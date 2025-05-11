{ config, lib, pkgs, home-manager, ... }:

{
  services.neo4j = {
    enable = true;
    directories.data = "/var/lib/neo4j/data";
    bolt.tlsLevel = "DISABLED";
  };
}
