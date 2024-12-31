{...}: {
  ## https://yazi-rs.github.io/docs/configuration/overview
  programs.yazi = {
    enable = true;
    # initLua = ./init.lua;
    # plugins = {};
    # settings = {};
    ## https://github.com/miikanissi/modus-themes.nvim/blob/master/extras/yazi/modus_vivendi.toml
    theme = {
      manager = {
        cwd = {
          fg = "#00d3d0";
          italic = true;
        };

        # Hovered
        hovered = {bg = "#2f3849";};
        preview_hovered = {bg = "#2f3849";};

        # Find
        find_keyword = {
          fg = "#ffffff";
          bg = "#7030af";
          bold = true;
        };
        find_position = {
          fg = "#79a8ff";
          bg = "#1e1e1e";
          bold = true;
        };

        # Marker
        marker_copied = {
          fg = "#70b900";
          bg = "#70b900";
        };
        marker_cut = {
          fg = "#ff5f59";
          bg = "#ff5f59";
        };
        marker_marked = {
          fg = "#feacd0";
          bg = "#feacd0";
        };
        marker_selected = {
          fg = "#2fafff";
          bg = "#2fafff";
        };

        # Tab
        tab_active = {
          fg = "#000000";
          bg = "#2fafff";
        };
        tab_inactive = {
          fg = "#989898";
          bg = "#000000";
        };
        tab_width = 1;

        # Count
        count_copied = {
          fg = "#000000";
          bg = "#70b900";
        };
        count_cut = {
          fg = "#000000";
          bg = "#ff6b55";
        };
        count_selected = {
          fg = "#000000";
          bg = "#79a8ff";
        };

        # Border
        border_symbol = "│";
        border_style = {fg = "#C4C4C4";};
      };

      status = {
        separator_open = "";
        separator_close = "";
        separator_style = {
          fg = "#0f0f0f";
          bg = "#0f0f0f";
        };

        # Mode
        mode_normal = {
          fg = "#000000";
          bg = "#2fafff";
          bold = true;
        };
        mode_select = {
          fg = "#000000";
          bg = "#f78fe7";
          bold = true;
        };
        mode_unset = {
          fg = "#000000";
          bg = "#db7b5f";
          bold = true;
        };

        # Progress
        progress_label = {
          fg = "#989898";
          bold = true;
        };
        progress_normal = {fg = "#000000";};
        progress_error = {fg = "#ff5f59";};

        # Permissions
        permissions_t = {fg = "#2fafff";};
        permissions_r = {fg = "#d0bc00";};
        permissions_w = {fg = "#ff5f59";};
        permissions_x = {fg = "#44bc44";};
        permissions_s = {fg = "#989898";};
      };

      select = {
        border = {fg = "#C4C4C4";};
        active = {
          fg = "#ffffff";
          bg = "#646464";
        };
        inactive = {fg = "#ffffff";};
      };

      input = {
        border = {fg = "#00bcff";};
        title = {};
        value = {fg = "#f78fe7";};
        selected = {bg = "#646464";};
      };

      completion = {
        border = {fg = "#00bcff";};
        active = {
          fg = "#ffffff";
          bg = "#646464";
        };
        inactive = {fg = "#ffffff";};
      };

      tasks = {
        border = {fg = "#C4C4C4";};
        title = {};
        hovered = {
          fg = "#ffffff";
          bg = "#646464";
        };
      };

      which = {
        cols = 3;
        mask = {bg = "#0f0f0f";};
        cand = {fg = "#00d3d0";};
        rest = {fg = "#2fafff";};
        desc = {fg = "#feacd0";};
        separator = "  ";
        separator_style = {fg = "#989898";};
      };

      notify = {
        title_info = {fg = "#00bcff";};
        title_warn = {fg = "#d0bc00";};
        title_error = {fg = "#ff5f59";};
      };

      help = {
        on = {fg = "#44bc44";};
        run = {fg = "#feacd0";};
        hovered = {bg = "#646464";};
        footer = {
          fg = "#ffffff";
          bg = "#0f0f0f";
        };
      };

      filetype = {
        rules = [
          # Images
          {
            mime = "image/*";
            fg = "#00d3d0";
          }

          # Media
          {
            mime = "{audio;video}/*";
            fg = "#fec43f";
          }

          # Archives
          {
            mime = "application/*zip";
            fg = "#feacd0";
          }
          {
            mime = "application/x-{tar;bzip*;7z-compressed;xz;rar}";
            fg = "#feacd0";
          }

          # Documents
          {
            mime = "application/{pdf;doc;rtf;vnd.*}";
            fg = "#00d3d0";
          }

          # Empty files
          {
            mime = "inode/x-empty";
            fg = "#ff5f59";
          }

          # Special files
          {
            name = "*";
            is = "orphan";
            bg = "#ff5f59";
          }
          {
            name = "*";
            is = "exec";
            fg = "#44bc44";
          }

          # { name = "*.rs"; fg = "#db7b5f"; };

          # Fallback
          {
            name = "*/";
            fg = "#2fafff";
          }
        ];
      };
    };
  };
}
