{...}: {
  # NOTE: udisks is a daemon to help with storage mounts
  ##      used by udiskie, an automounter
  services.udisks2 = {
    enable = true;
  };
}
