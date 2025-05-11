{ config, lib, pkgs, home-manager, ... }:
{
  # Setups gnome-keyring-daemon to save application secrets securily
  services.gnome.gnome-keyring.enable = true;
  # This will auto-decrypt it on login
  security.pam.services.login.enableGnomeKeyring = true;
}
