{pkgs, ...}: {
  # https://wiki.hyprland.org/Hypr-Ecosystem/hypridle/
  # https://github.com/hyprwm/hypridle/blob/main/nix/hm-module.nix
  # imports = [hypridle.homeManagerModules.default];
  services.hypridle = {
    enable = true;
    # lockCmd = "pidof ${pkgs.waylock}/bin/waylock || ${pkgs.waylock}/bin/waylock";
    settings = {
      general = {
        lock_cmd = "pidof ${pkgs.hyprlock}/bin/hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 150;
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10";
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -r";
        }
        {
          timeout = 300;
          on-timeout = "${pkgs.systemd}/bin/loginctl lock-session";
        }
        {
          timeout = 600;
          on-timeout = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
          on-resume = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
        }
        {
          timeout = 1200;
          on-timeout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
}
