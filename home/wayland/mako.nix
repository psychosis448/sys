{
  config,
  pkgs,
  ...
}: {
  # TODO: use nix-colors for color config
  # https://mynixos.com/home-manager/option/services.mako
  # https://github.com/emersion/mako/blob/master/mako.5.scd
  services.mako = {
    enable = true;
    settings = {
      layer = "overlay";
      sort = "-time";
      width = 300;
      height = 110;
      borderSize = 1;
      borderRadius = 5;
      icons = true;
      maxIconSize = 64;
      defaultTimeout = 4000;
      ignoreTimeout = false;
      font = "monospace 10";
      backgroundColor = "#111111";
      textColor = "#d4d4d4";
      borderColor = "#d4d4d490";
      "urgency=critical" = {
        border-color = "#d20f39";
        default-timeout = 0;
      };
    };
  };
}
