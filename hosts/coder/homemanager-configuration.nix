{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../home/desktop-env/fonts.nix
    ../../home/git
    ../../home/nvim
    ../../home/shell
  ];
  home.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
  fonts = {
    fontconfig = {
      defaultFonts = {
        serif = ["FiraCode Nerd Font Mono"];
        emoji = ["FiraCode Nerd Font"];
        monospace = ["FiraCode Nerd Font Mono"];
        sansSerif = ["FiraCode Nerd Font"];
      };
    };
  };

  home.sessionVariables = {
    SHELL = "$HOME/.nix-profile/bin/zsh";
  };
  programs.zsh.envExtra = ". $HOME/.nix-profile/etc/profile.d/nix.sh";

  home.file.vscode-user-settings = {
    target = "${config.xdg.dataHome}/code-server/User/settings.json";
    text = ''
      {
        "workbench.colorTheme": "Visual Studio Dark",
        "redhat.telemetry.enabled": false,
        "workbench.startupEditor": "none",
        "git.confirmSync": false,
        "git.enableSmartCommit": true,
        "git.autofetch": true,
        "security.workspace.trust.enabled": false,
        "security.workspace.trust.startupPrompt": "never",
        "security.workspace.trust.untrustedFiles": "open",
        "remote.autoForwardPortsSource": "hybrid",
        "editor.fontFamily": "'FiraCode Nerd Font'",
        "terminal.integrated.defaultProfile.linux": "zsh",
        "terminal.integrated.profiles.linux": {
          "zsh": {
            "path": "$HOME/.nix-profile/bin/zsh"
          }
        }

      }
    '';
  };

  home = {
    username = "coder";
    homeDirectory = "/home/coder";
  };
  home.stateVersion = "24.05";
}
