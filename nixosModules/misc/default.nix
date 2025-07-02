{ config, lib, pkgs, home-manager, ... }:
{
  imports = [
    ./keyboard.nix
    ./hardware.nix
  ];

  environment.systemPackages = with pkgs; [
    wget
  ];
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
} 
