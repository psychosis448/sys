{config, ...}: {
  # https://github.com/hyprwm/hyprpaper/blob/main/nix/hm-module.nix
  services.hyprpaper = {
    enable = true;
    settings = let
      wp = "jinx-graffiti-3840x2160-19975.jpg ";
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
