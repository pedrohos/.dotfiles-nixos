{ config, lib, pkgs, home-manager, ... }:

{
  options = {
    #keyboardModule.enable
  };

  # Configure keymap in X11
  config.services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  # Configure console keymap
  config.console.keyMap = "us";

  # Select internationalisation properties.
  config.i18n.defaultLocale = "en_US.UTF-8";

  config.i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
    LC_CTYPE = "pt_BR.UTF-8"; # Fix the cedilla in us-intl
  };
}
