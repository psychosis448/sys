{config, ...}: {
  # https://github.com/hyprwm/hyprpaper/blob/main/nix/hm-module.nix
  services.hyprpaper = {
    enable = true;
    settings = let
      wp = "0-wallpaper.jpg";
    in {
      preload = [
        "${config.xdg.userDirs.pictures}/wallpapers/${wp}"
      ];
      ## NOTE: set wallpaper for all monitors
      wallpaper = [
        ",${config.xdg.userDirs.pictures}/wallpapers/${wp}"
      ];
    };
  };
}
