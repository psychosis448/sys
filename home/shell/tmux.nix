{
  pkgs,
  config,
  ...
}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-Space";
    shortcut = "Space";
    keyMode = "vi";
    sensibleOnTop = true;
    # https://search.nixos.org/packages?channel=unstable&query=tmux
    plugins = with pkgs; [
      # https://github.com/tmux-plugins/tmux-pain-control
      tmuxPlugins.pain-control
      # https://github.com/tmux-plugins/tmux-sessionist
      tmuxPlugins.sessionist
      # https://github.com/tmux-plugins/tmux-resurrect
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-dir "${config.xdg.dataHome}/tmux"
        '';
      }
      # https://github.com/tmux-plugins/tmux-continuum
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10' # minutes
        '';
      }
      # https://github.com/sainnhe/tmux-fzf
      {
        plugin = tmuxPlugins.tmux-fzf;
        extraConfig = ''
          unbind s
          bind-key "s" run-shell -b "${pkgs.tmuxPlugins.tmux-fzf}/share/tmux-plugins/tmux-fzf/scripts/session.sh switch"
          unbind r
          bind-key "r" run-shell -b "${pkgs.tmuxPlugins.tmux-fzf}/share/tmux-plugins/tmux-fzf/scripts/session.sh rename"
          unbind a
          bind-key "a" run-shell -b "${pkgs.tmuxPlugins.tmux-fzf}/share/tmux-plugins/tmux-fzf/scripts/session.sh new"
        '';
      }
    ];
    extraConfig = let
      fg = "#f0f0f0";
      fg-alt = "#000000";
      fg-dim = "#989898";
      bg = "#000000";
      bg-dim = "#1e1e1e";
      bg-active = "#535353";
      bg-inactive = "#303030";
      ## warmer tones
      red = "#ff6b55";
      green = "#88ca9f";
      blue = "#82b0ec";
      yellow = "#fec43f";
    in ''
      set -g status-bg "${bg-inactive}"
      set -g status-fg "${fg}"
      set -g message-style bg='${blue}',fg='${fg-alt}' # alternative bg='${blue},${yellow}'
      set -g status-left-length 150
      set -g status-left "#[fg=${fg-alt},bg=${blue},bold]#{?client_prefix,#[bg=${green}],} #S "
      set -g window-status-current-format "#[fg=${fg}] #I #W "
      set -g window-status-format "#[fg=${fg-dim},noitalics,nounderscore] #I #W "
      set -g window-status-separator "|"
      set -g status-right-length 150
      set -g pane-border-style "fg=${fg-dim}"
      set -g pane-active-border-style "fg=${green}"
    '';
  };
}
