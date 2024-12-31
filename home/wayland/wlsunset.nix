{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.wlsunset];

  # https://mynixos.com/home-manager/options/services.wlsunset
  services.wlsunset = {
    enable = true;
    # NOTE: berlin
    latitude = "52";
    longitude = "13";
    # NOTE: bangkok
    # latitude = "18";
    # longitude = "98";
  };
}
