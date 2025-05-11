{ config, lib, pkgs, home-manager, ... }:

{
  options = {
    steamModule.enable = lib.mkEnableOption "enables steam";
  };

  config = lib.mkIf config.steamModule.enable {
    programs.steam.enable = true;

    # For 32-bit games (required on 64-bit systems)
    hardware.opengl.driSupport32Bit = true;
    hardware.pulseaudio.support32Bit = true;
  };
}
