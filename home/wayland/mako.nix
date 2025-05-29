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
      border-size = 1;
      border-radius = 5;
      icons = true;
      max-icon-size = 64;
      default-timeout = 4000;
      ignore-timeout = false;
      font = "monospace 10";
      background-color = "#111111";
      text-color = "#d4d4d4";
      border-color = "#d4d4d490";
      "urgency=critical" = {
        border-color = "#d20f39";
        default-timeout = 0;
      };
    };
  };
}
