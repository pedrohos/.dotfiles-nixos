{ config, lib, pkgs, home-manager, ... }:
{
  imports = [
    ./guimodule.nix
    ./steam.nix
    ./vim.nix
  ];

  # General package installation & configuration
  programs = {
    zsh.enable = true;
    firefox.enable = true;
  };
}
