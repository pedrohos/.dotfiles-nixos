{ pkgs, ... }:

{
  home.username = "pedrohos";
  home.homeDirectory = "/home/pedrohos";
  home.stateVersion = "24.11"; # Match your NixOS version

  programs.bash.enable = true;
  
  # The state version is required and should stay at the version you
  # originally installed.
  #home.stateVersion = "24.11";

  home.packages = with pkgs; [
    neovim
    htop
    git
    vscode
    brave
    spotify
    bitwarden
    zsh
    oh-my-zsh
    discord
    anydesk
    steam-run
    python312Packages.conda
    python312Full
    conda
    neo4j
    slack
    unzip
  ];

  programs.git = {
    enable = true;
    userName = "Pedro Silva";
    userEmail = "pedro.henrique.silva@ccc.ufcg.edu.br";
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

    shellAliases = {
      update = "sudo nixos-rebuild switch";
    };
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
}
