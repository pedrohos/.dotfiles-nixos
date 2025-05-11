{ config, lib, pkgs, home-manager, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Hyprland packages
    waybar # Top bar with json and css
    dunst # Notifications 
    libnotify # Dependency for dusnt
    swww # Wayland daemons
    kitty # Terminal emulator
    rofi-wayland # Window siwtcher
    networkmanagerapplet # Network manager applet available on the waybar
    gnome-icon-theme
  ];

  # Hyprland Wayland compositor
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  #services.xserver.desktopManager.gnome.enable = true;

  # Handles screen sharing and other interactions between apps
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
