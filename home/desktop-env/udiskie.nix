{pkgs, ...}: {
  ## NOTE: automounter
  ##       requires udisks2 servcie to run
  services.udiskie.enable = true;
}
