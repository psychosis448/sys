{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh"; # automatically adds $HOME in front
    history = {
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };
    initExtra = ''
      bindkey -v
    '';
  };

  ## NOTE: enable integrations
  programs = {
    carapace.enableZshIntegration = true;
    direnv.enableZshIntegration = true;
    eza.enableZshIntegration = true;
    fzf.enableZshIntegration = true;
    starship.enableZshIntegration = true;
    # zellij.enableZshIntegration = true;
    zoxide.enableZshIntegration = true;
  };
}
