{ pkgs, pkgs-unstable, chromium-widevine-pkg, system, ... }:

{
  home.username = "pedrohos";
  home.homeDirectory = "/home/pedrohos";
  # The state version is required and should stay at the version you
  home.stateVersion = "24.11"; # Match your NixOS version

  programs.bash.enable = true;

  home.packages = with pkgs; [
    neovim
    htop
    git
    vscode
    brave
    nextcloud-client
    logseq
    pkgs-unstable.legcord
    bitwarden
    zsh
    oh-my-zsh
    anydesk
    #steam-run
    python312Packages.conda
    python312Full
    conda
    neo4j
    slack
    unzip
  ];

/*
  home.packages = with pkgs-unstable; [
    legcord
  ];
*/
  programs.git = {
    enable = true;
    userName = "Pedro Silva";
    userEmail = "pedro.henrique.silva@ccc.ufcg.edu.br";
    extraConfig = {
      safe.directory = "/home/pedrohos/.dotfiles";
    };
  };
  
  # This chromium can be used to run spotify
  programs.chromium = {
    enable = true;
    package = chromium-widevine-pkg;
  };

  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
    GTK_IM_MODULE = "cedilla";
    QT_IM_MODULE = "cedilla";
  };

  # Remember to delete the ~/.zshrc file if it were already generated before
  # Shell config
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ ];
      theme = "robbyrussell";
    };

    initExtra = ''
      update() {
        NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild build --flake .#$@ --impure --show-trace
      }
    '';
  };

  # Other Home Manager modules
  programs.tmux.enable = true;

  # Define locales for keyboard layout
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      kb_variant = "alt-intl";
    };
  };

  home.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "us";
    XKB_DEFAULT_VARIANT = "alt-intl";
  };

  home.file.".local/share/applications/chromium-browser.desktop" = {
    enable = system == "aarch64-linux";
    text = ''
      [Desktop Entry]
      Name=Chromium
      GenericName=browser
      Comment=Chromium browser with Widevine
      Exec=${chromium-widevine-pkg}/bin/chromium
      Terminal=false
      Type=Application
      Keywords=browser;internet;
      Icon=/home/pedrohos/.dotfiles/icons/chromium.svg
      Categories=Utility;
    '';
  };

  # Spotify
  home.file.".local/share/applications/spotify.desktop" = {
    enable = system == "aarch64-linux";
    text = ''
      [Desktop Entry]
      Name=Spotify
      GenericName=music
      Comment=Listen to Spotify
      Exec=${chromium-widevine-pkg}/bin/chromium --app=https://open.spotify.com
      Terminal=false
      Type=Application
      Keywords=music;
      Icon=/home/pedrohos/.dotfiles/icons/spotify.svg
      Categories=Music;
    '';
  };
}
