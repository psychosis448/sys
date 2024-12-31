{
  config,
  pkgs,
  ...
}: {
  # https://nixos.wiki/wiki/Command_Shell
  programs.zsh.enable = true;
  environment.shells = with pkgs; [zsh];
  # NOTE: sets default shell for all users
  # configure shell for user: users.users.${USERNAME}.shell = pkgs.zsh;
  users.defaultUserShell = pkgs.zsh;
  ## NOTE: just same base aliases to better move around
  environment.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    "cp" = "cp -a";
    "ls" = "ls --color=auto";
    "ll" = "ls -lh";
    "la" = "ls -lha";
  };
}
