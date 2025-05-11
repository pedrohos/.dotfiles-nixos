{ config, lib, pkgs, home-manager, ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;
}
