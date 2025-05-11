{ config, lib, pkgs, home-manager, ... }:
{
  imports = [
    ./keyboard.nix
    ./hardware.nix
  ];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
