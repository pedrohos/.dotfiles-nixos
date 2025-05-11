# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, home-manager, ... }:

{
  imports =
  [ # Include the results of the hardware scan.
      ./misc/default.nix
      ./services/default.nix
      ./programs/default.nix
  ];

  # Home manager initial config
  home-manager.users.pedrohos = import /home/pedrohos/.dotfiles/home.nix;

  #nixpkgs.config.allowUnsupportedSystem = true; 
  #nixpkgs.config.allowUnsupportedSystem = true; 
  #pkgs.config.allowUnsupportedSystems = true; 

  # Initial config the user
  users.users.pedrohos = {
    isNormalUser = true;
    #shell = lib.mkDefault pkgs.zsh;
    description = "pedrohos";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # INSERT HERE PKGS
  ];

  #home-manager.useGlobalPkgs = true;
  #home-manager.useUserPackages = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  # Set your time zone.
  time.timeZone = "America/Maceio";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1"; 
    NIXPKGS_ALLOW_UNFREE = 1;
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
