{
  config,
  pkgs,
  ...
}: {
  ## TODO: https://github.com/nix-community/emacs-overlay
  ## NOTE: manual setup for doomemacs required
  ## git clone --depth 1 https://github.com/doomemacs/doomemacs $XDG_CONFIG_HOME/emacs
  ## $XDG_CONFIG_HOME/emacs/bin/doom install
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages = epkgs: [];
  };

  services.emacs = {
    enable = true;
    extraOptions = [
      "--init-directory=${config.xdg.configHome}/emacs"
    ];
    startWithUserSession = "graphical";
    client.enable = true;
    socketActivation.enable = true;
  };

  home.sessionPath = ["$XDG_CONFIG_HOME/emacs/bin"];

  ## BUG:
  ## https://github.com/nix-community/home-manager/pull/1455#issuecomment-681041818
  ## https://github.com/nix-community/home-manager/issues/3514#issuecomment-2541776151
  xdg.configFile = {
    doom = {
      source = ./doom;
      onChange = "${config.xdg.configHome}/emacs/bin/doom sync";
    };
    # emacs = let
    #   doom-emacs = pkgs.fetchFromGitHub {
    #     repo = "doom-emacs";
    #     owner = "hlissner";
    #     rev = "master";
    #     hash = "sha256-sebujw5VvBWMS+wXyjiGF81iyjPM/QQDnw5l7tDJCvk=";
    #   };
    # in {
    #   source = config.lib.file.mkOutOfStoreSymlink doom-emacs;
    #   #   if [ ! -d "${config.xdg.configHome}/doom" ]; then
    #   #     ${config.xdg.configHome}/emacs/bin/doom -y install
    #   #   else
    #   #     ${config.xdg.configHome}/emacs/bin/doom -y sync -u
    #   #   fi
    #   # ''}";
    # };
  };
}
