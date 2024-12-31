{...}: {
  imports = [
    ./carapace.nix
    ./direnv.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./ripgrep.nix
    ./starship.nix
    ./tmux.nix
    ./yazi.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.shellAliases = {
    ll = "ls -l";
    la = "ls -la";
    cp = "cp -a";
    ".." = "cd ..";
  };
}
