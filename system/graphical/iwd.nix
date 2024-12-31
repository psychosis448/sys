{...}: {
  ## NOTE: Use iwd for wifi
  ##       https://nixos.wiki/wiki/Iwd
  ## TODO:Encrypted iwd profiles https://wiki.archlinux.org/title/Iwd#Encrypted_network_profiles
  networking.wireless = {
    iwd = {
      enable = true;
      settings = {
        Settings = {
          AutoConnect = true;
        };
      };
    };
  };
  networking.networkmanager = {
    wifi.backend = "iwd";
  };
}
