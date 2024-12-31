{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.poweralertd];

  services.poweralertd.enable = true;
}
