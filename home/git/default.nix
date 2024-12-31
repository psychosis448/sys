{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "psychosis448";
    ## TODO: set user email
    userEmail = "";
    delta.enable = true;
    aliases = {
      "gs" = "status";
      "gc" = "git commit -m";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
    # signing = {};
  };
}
