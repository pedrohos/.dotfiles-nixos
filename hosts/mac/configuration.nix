# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, home-manager, ... }:

#let
#  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/master.tar.gz;
#in
{
  imports =
  [ # Include the results of the hardware scan.
      ../../nixosModules/default.nix
      ./hardware-configuration.nix
      /etc/nixos/apple-silicon-support
      #(import "${home-manager}/nixos")
  ];

  config.hardware = {
    asahi = {
      withRust = true;
      peripheralFirmwareDirectory = /etc/nixos/firmware;
      useExperimentalGPUDriver = true;
      experimentalGPUInstallMode = "replace";
      setupAsahiSound = true;
    };
   
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  config.steamModule.enable = false;

  # Home manager initial config
  #home-manager.users.pedrohos = import ./home.nix;
  #home-manager.useGlobalPkgs = true;
  #home-manager.useUserPackages = true;

  # Bootloader.
  config.boot.loader.systemd-boot.enable = true;
  config.boot.loader.efi.canTouchEfiVariables = false;

  # Set your time zone.
  config.time.timeZone = "America/Maceio";

  # Enable sound with pipewire.
  #hardware.pulseaudio.enable = false;
  #security.rtkit.enable = true;
  #services.pipewire = {
  #  enable = true;
  #  alsa.enable = true;
  #  alsa.support32Bit = true;
  #  pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  #};

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  # Allow unfree packages
  config.nixpkgs.config.allowUnfree = true;

  config.environment = {
    sessionVariables = {
      # Hint electron apps to use wayland
      NIXOS_OZONE_WL = "1"; 
      NIXPKGS_ALLOW_UNFREE = lib.mkForce "1";
    };
    etc = {
      "resolv.conf".text = "nameserver 1.1.1.1\n";
    };
    systemPackages = with pkgs; [
      # ADD PACKAGES HERE
    ];
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
  config.system.stateVersion = "25.05"; # Did you read the comment?
}
