{
  lib,
  pkgs,
  ...
}: {
  services.kanshi.systemdTarget = "hyprland-session.target";
  programs.waybar.settings = {
    mainBar = {
      modules-left = ["custom/os" "hyprland/workspaces"];
    };
  };
  wayland.windowManager.hyprland.settings = {
    bindl = [
      ",switch:off:Lid Switch,exec,${pkgs.kanshi}/bin/kanshictl switch docked-opened"
      ",switch:on:Lid Switch,exec,${pkgs.kanshi}/bin/kanshictl switch docked-closed"
    ];
  };
}
