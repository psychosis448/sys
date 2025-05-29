{config, ...}: {
  programs.hyprlock = {
    enable = true;
    ## https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/
    ## https://github.com/hyprwm/hyprlock/blob/main/nix/hm-module.nix#L79
    settings = {
      background = [
        {
          path = "${config.xdg.userDirs.pictures}/wallpapers/0-lockpaper.jpg";
          blur_passes = 1;
          color = "rgba(17, 17, 17, 1.0)";
        }
      ];
      input-field = [
        {
          fail_text = "";
        }
      ];
      label = [
        {
          text = "$TIME";
        }
      ];
    };
  };
}
