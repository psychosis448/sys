{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    ## NOTE: needed for steam
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      monitor = ",highres,auto,1";
      # exec-once = [
      #   "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      # ];

      xwayland = {
        force_zero_scaling = true;
      };

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "no";
          clickfinger_behavior = false;
        };
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        gaps_in = 0;
        gaps_out = 0;
        border_size = 2;
        no_border_on_floating = true;
        "col.active_border" = "rgba(46464699)";
        "col.inactive_border" = "rgba(1e1e1eee)";
        layout = "dwindle";
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        rounding = 5;
        blur = {
          enabled = true;
          size = 5;
          passes = 1;
          ignore_opacity = false;
        };

        inactive_opacity = 1.0;
        active_opacity = 1.0;
        fullscreen_opacity = 1.0;

        dim_inactive = true;
        dim_strength = 0.1;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      animations = {
        enabled = "yes";

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "yes"; # you probably want this
      };

      master = {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        # new_status = "master";
        # new_is_master = true;
      };

      gestures = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = "off";
      };

      # # Example per-device config
      # # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      # "device:epic-mouse-v1" = {
      #   sensitivity = -0.5;
      # };

      # # Example windowrule v2
      # # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      # # idleinhibit [mode]	sets an idle inhibit rule for the window. If active, apps like swayidle will not fire. Modes: none, always, focus, fullscreen
      windowrulev2 = [
        "float,class:^(wlogout)$,title:^(wlogout)$"
        # "idleinhibit always,class:^(Spotify)$"
      ];
      #
      # # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      "$mainMod" = "SUPER";
      #
      # # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      # # For dispatchers, see https://wiki.hyprland.org/Configuring/Dispatchers/
      # # For rules, see https://wiki.hyprland.org/Configuring/Window-Rules/#rules
      bindr = [
        "$mainMod, P, exec, pkill fuzzel || fuzzel"
      ];

      # TODO: move app specific bindings out...
      bind = [
        "$mainMod, RETURN, exec, ${pkgs.foot}/bin/footclient"
        # "$mainMod, Q, exec, ${pkgs.qutebrowser}/bin/qutebrowser"
        "$mainMod, F, exec, ${pkgs.firefox}/bin/firefox"
        "$mainMod, V, togglefloating, "
        # $mainMod, P, pseudo, # dwindle
        "$mainMod, T, togglesplit,"
        "$mainMod, O, exec, hyprctl setprop active opaque toggle"
        "$mainMod SHIFT, C, killactive, "
        "$mainMod SHIFT, Q, exit,"
        "$mainMode SHIFT, L, exec, ${pkgs.systemd}/bin/loginctl lock-session"
        # TODO: create custom, better fitting animation for wlogout :P
        "$mainMode SHIFT, S, exec, [float,noanim] ${pkgs.wlogout}/bin/wlogout"
        "$mainMod SHIFT, F, fullscreen, 0"

        # Move focus with mainMod + arrow keys
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Function Keys on laptop
        ", XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause "
        ", XF86AudioPause, exec, ${pkgs.playerctl}/bin/playerctl play-pause "
        ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"
        # TODO: bluetoothctl show -> "Powered: yes" => turn off (otherwise turn on)
        # ... get proper path -> services.blueman
        ", XF86Bluetooth, exec, bluetoothctl power off"
      ];

      # # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };
    };
    extraConfig = ''
      # Resize window
      bind= $mainMod, R, submap, resize
      submap=resize
      binde= , L, resizeactive, 10 0
      binde= , H, resizeactive, -10 0
      binde= , K, resizeactive, 0 -10
      binde= , J, resizeactive, 0 10
      bind= , escape, submap, reset
      submap=reset
    '';
  };
}
