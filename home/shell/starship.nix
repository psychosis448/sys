{lib, ...}: {
  programs.starship = {
    enable = true;
    ## https://starship.rs/config/
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        # "$username"
        # "$hostname"
        "$shlvl"
        "$kubernetes"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$golang"
        "$helm"
        "$lua"
        "$terraform"
        "$nix_shell"
        "$direnv"
        "$sudo"
        "$container"
        "$shell"
        "$character"
      ];
      git_status = {
        ahead = "⇡\${count}";
        deleted = "✘\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        modified = "!\${count}";
        renamed = "»\${count}";
        staged = "+\${count}";
        untracked = "?\${count}";
      };
    };
  };
}
