{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [waybar playerctl];
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    ## https://github.com/Alexays/Waybar/wiki
    ## NOTE: icons used are nf-md
    ## https://www.nerdfonts.com/cheat-sheet
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        ## NOTE: is defined in overlay on per machine level
        # modules-left = ["custom/os" "hyprland/workspaces"];
        modules-center = ["mpris"];
        modules-right = ["network" "bluetooth" "battery" "clock"];

        "custom/os" = {
          "format" = " {} ";
          "exec" = ''echo ""'';
          "interval" = "once";
        };

        mpris = {
          player = "spotify";
          format = "{dynamic}";
          dynamic-order = ["artist" "title"];
          ignored-players = ["firefox" "qutebrowser"];
        };

        network = {
          format = "󰌘 {ifname}";
          format-wifi = "󰖩 {essid} ({signalStrength}%)";
          format-ethernet = "󰲝 {ipaddr}/{cidr}";
          format-disconnected = "󰌙";
          tooltip-format = "󰌘 {ifname} via {gwaddr}";
          tooltip-format-wifi = "󰖩 {essid} ({signalStrength}%)";
          tooltip-format-ethernet = "󰲝 {ifname}";
          tooltip-disconnected = "Disconnected";
          max-length = 50;
        };

        bluetooth = {
          format-disabled = " 󰂲 ";
          format-off = " 󰂲 ";
          format-on = " 󰂯 ";
          format-connected = "󰂱 {num_connections}";
          on-click-right = "${pkgs.blueman}/bin/blueman-manager";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        };

        battery = {
          format = "{icon} {capacity}%";
          format-icons = ["󰁺" "󰁼" "󰁾" "󰂀" "󰂂"];
          format-charging = "󰂄 {capacity}%";
          format-full = "󰁹 {capacity}%";
          states = {
            critical = 15;
          };
        };

        clock = {
          format = "󰃭 {:%b %d, %H:%M}";
          locale = "en_DK.UTF-8";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "left";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              today = "<span color='#ea7183'><b><u>{}</u></b></span>";
              weeks = "<span color='#63677f'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
      };
    };
    ## https://github.com/Alexays/Waybar/blob/master/resources/style.css
    style = ''
      window#waybar {
        background-color: #111111;
        color: #d4d4d4;
      }
      #workspaces button {
        padding: 0 5px;
        color: #d4d4d4;
      }
      #workspaces button.active {
          border-radius: 0;
          box-shadow: inset 0px 2px;
      }
      #workspaces button.focused {
          border-radius: 0;
          box-shadow: inset 0px 2px;
      }
      #window,
      #workspaces {
        margin: 0 4px;
      }
      #custom-os {
        color: #5277c3;
      }
      #battery.critical {
        color: #ea7183;
      }
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd {
        padding: 0 10px;
      }
    '';
  };
}
