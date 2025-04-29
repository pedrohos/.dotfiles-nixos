{ pkgs, ... }:

{
  home.username = "pedrohos";
  home.homeDirectory = "/home/pedrohos";
  home.stateVersion = "24.11"; # Match your NixOS version

  home.packages = with pkgs; [
    discord
    neovim
    htop
    git
    vscode
    brave
    spotify
    bitwarden
    zsh
    oh-my-zsh
    anydesk
    steam-run
    python312Packages.conda
    python312Full
    conda
    neo4j
    slack
  ];

  programs.bash.enable = true;

  programs.git = {
    enable = true;
    userName = "Pedro Silva";
    userEmail = "pedro.henrique.silva@ccc.ufcg.edu.br";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Default shell
    #shellInit = ''
    #  export SHELL="${pkgs.zsh}/bin/zsh"
    #'';
    
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "thefuck"];
      theme = "robbyrussell";
    };

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];
  };


  home.sessionVariables = {
    # Set my shell
    #SHELL = "${pkgs.zsh}/bin/zsh";

    # Fix cedilla issues when typing ' + c
    GTK_IM_MODULE = "cedilla";
    QT_IM_MODULE = "cedilla";
  };


  # Shell config
  #shell = pkgs.zsh;

  #programs.oh-my-zsh.enable = true;

  # Other Home Manager modules
  programs.tmux.enable = true;
}
