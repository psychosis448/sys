{pkgs, ...}: {
  imports = [
    ## NOTE: configure supported locales
    ./i18.nix
    ## NOTE: adds dach umlaute
    ./keyd.nix
    ## NOTE:configures default editor
    ./nvim.nix
    ## NOTE: configures default shell
    # ./zsh.nix
  ];

  ## NOTE: add ~/.local/bin/ to $PATH
  environment.localBinInPath = true;

  ## NOTE: base packages
  environment.systemPackages = with pkgs; [
    tmux
    wget
    curl
    unzip
    fzf
    ripgrep
    jq
    yq
  ];
}
