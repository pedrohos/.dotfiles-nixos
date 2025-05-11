{ config, lib, pkgs, home-manager, ... }:

{
  networking.hostName = "nixos"; # Define your hostname.

  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };

  environment.etc = {
    "resolv.conf".text = "nameserver 1.1.1.1\n";
  };
}
