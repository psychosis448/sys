{config,pkgs,...}:{
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

  home.sessionPath = [ "$XDG_CONFIG_HOME/emacs/bin" ];

  ## TODO: when done configuring:
  ## write doom config!

  ## https://bhankas.org/blog/deploying_doom_emacs_config_via_nixos_home_manager/
  ## https://discourse.nixos.org/t/advice-needed-installing-doom-emacs/8806/8
  ## https://discourse.doomemacs.org/t/installing-doom-emacs-on-nixos/4600/2
  ## https://github.com/hlissner/dotfiles/blob/531e90f4e5e27a13f23ad2d8adf2f2f57aa0c08a/modules/editors/emacs.nix#L4
  ##
  # xdg = {
  #   configFile = {
  #     "emacs" = {
  #       source = pkgs.fetchFromGitHub {
  #         owner = "hlissner";
  #         repo = "doom-emacs";
  #         rev = "master";
  #         hash = "sha256-sebujw5VvBWMS+wXyjiGF81iyjPM/QQDnw5l7tDJCvk=";
  #       };
  #       # onChange = "${pkgs.writeShellScript "doom-change" ''
  #       #   if [ ! -d "${config.xdg.configHome}/doom" ]; then
  #       #     ${config.xdg.configHome}/emacs/bin/doom -y install
  #       #   else
  #       #     ${config.xdg.configHome}/emacs/bin/doom -y sync -u
  #       #   fi
  #       # ''}";
  #     };
  #   };
  # };
}
