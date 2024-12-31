{pkgs, ...}: {
  ## NOTE: portal config, for screensharing
  ## https://elis.nu/blog/2021/02/detailed-setup-of-screen-sharing-in-sway/
  ## test: https://mozilla.github.io/webrtc-landing/gum_test.html
  ## https://gist.github.com/brunoanc/2dea6ddf6974ba4e5d26c3139ffb7580
  ## issue: https://github.com/hyprwm/Hyprland/issues/4593
  ## check: systemctl status --user xdg-desktop-portal-hyprland
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}
