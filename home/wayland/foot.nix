{
  config,
  pkgs,
  ...
}: {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        # shell=$SHELL (if set, otherwise user's default shell from /etc/passwd)
        # term=foot (or xterm-256color if built with -Dterminfo=disabled)
        # login-shell=no

        # app-id=foot # globally set wayland app-id. Default values are "foot" and "footclient" for desktop and server mode
        # title=foot
        # locked-title=no

        font = "monospace:size=14";
        # font-bold=<bold variant of regular font>
        # font-italic=<italic variant of regular font>
        # font-bold-italic=<bold+italic variant of regular font>
        # font-size-adjustment=0.5
        # line-height=<font metrics>
        # letter-spacing=0
        # horizontal-letter-offset=0
        # vertical-letter-offset=0
        # underline-offset=<font metrics>
        # underline-thickness=<font underline thickness>
        # box-drawings-uses-font-glyphs=no
        # dpi-aware=no

        # initial-window-size-pixels=700x500  # Or,
        # initial-window-size-chars=<COLSxROWS>
        # initial-window-mode=windowed
        pad = "5x5 center"; # optionally append 'center'
        # resize-delay-ms=100

        # notify=notify-send -a ${app-id} -i ${app-id} ${title} ${body}

        # bold-text-in-bright=no
        # word-delimiters=,│`|:"'()[]{}<>
        # selection-target=primary
        # workers=<number of logical CPUs>
        # utmp-helper=/usr/lib/utempter/utempter  # When utmp backend is ‘libutempter’ (Linux)
        # utmp-helper=/usr/libexec/ulog-helper    # When utmp backend is ‘ulog’ (FreeBSD)
      };
      environment = {
        # name=value
      };
      bell = {
        # urgent=no
        # notify=no
        # command=
        # command-focused=no
      };
      scrollback = {
        # multiplier=3.0
        # indicator-position=relative
        # indicator-format=""
      };
      url = {
        # launch=xdg-open ${url}
        # label-letters=sadfjklewcmpgh
        # osc8-underline=url-mode
        # protocols=http, https, ftp, ftps, file, gemini, gopher
        # uri-characters=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+="'()[]
      };
      cursor = {
        color = "ffffff 7030af";
        # style=block
        # color=<inverse foreground/background>
        # blink=no
        # beam-thickness=1.5
        # underline-thickness=<font underline thickness>
      };
      mouse = {
        # hide-when-typing=no
        # alternate-scroll-mode=yes
      };
      touch = {
        # long-press-delay=400
      };
      colors = {
        alpha = 1.0;
        foreground = "ffffff";
        background = "000000";
        selection-foreground = "ffffff";
        selection-background = "7030af";
        urls = "c6daff";

        regular0 = "000000";
        regular1 = "ff5f59";
        regular2 = "44bc44";
        regular3 = "d0bc00";
        regular4 = "2fafff";
        regular5 = "feacd0";
        regular6 = "00d3d0";
        regular7 = "ffffff";

        bright0 = "1e1e1e";
        bright1 = "ff5f5f";
        bright2 = "44df44";
        bright3 = "efef00";
        bright4 = "338fff";
        bright5 = "ff66ff";
        bright6 = "00eff0";
        bright7 = "989898";

        "16" = "fec43f";
        "17" = "ff9580";

        ## Normal/regular colors (color palette 0-7)
        # regular0=242424  # black
        # regular1=f62b5a  # red
        # regular2=47b413  # green
        # regular3=e3c401  # yellow
        # regular4=24acd4  # blue
        # regular5=f2affd  # magenta
        # regular6=13c299  # cyan
        # regular7=e6e6e6  # white

        ## Bright colors (color palette 8-15)
        # bright0=616161   # bright black
        # bright1=ff4d51   # bright red
        # bright2=35d450   # bright green
        # bright3=e9e836   # bright yellow
        # bright4=5dc5f8   # bright blue
        # bright5=feabf2   # bright magenta
        # bright6=24dfc4   # bright cyan
        # bright7=ffffff   # bright white

        ## dimmed colors (see foot.ini(5) man page)
        # dim0=<not set>
        # ...
        # dim7=<not-set>

        ## The remaining 256-color palette
        # 16 = <256-color palette #16>
        # ...
        # 255 = <256-color palette #255>

        ## Misc colors
        # selection-foreground=<inverse foreground/background>
        # selection-background=<inverse foreground/background>
        # jump-labels=<regular0> <regular3>          # black-on-yellow
        # scrollback-indicator=<regular0> <bright4>  # black-on-bright-blue
        # search-box-no-match=<regular0> <regular1>  # black-on-red
        # search-box-match=<regular0> <regular3>     # black-on-yellow
        # urls=<regular3>
      };
      csd = {
        # preferred=server
        # size=26
        # font=<primary font>
        # color=<foreground color>
        # hide-when-maximized=no
        # double-click-to-maximize=yes
        # border-width=0
        # border-color=<csd.color>
        # button-width=26
        # button-color=<background color>
        # button-minimize-color=<regular4>
        # button-maximize-color=<regular2>
        # button-close-color=<regular1>
      };
      key-bindings = {
        # scrollback-up-page=Shift+Page_Up
        # scrollback-up-half-page=none
        # scrollback-up-line=none
        # scrollback-down-page=Shift+Page_Down
        # scrollback-down-half-page=none
        # scrollback-down-line=none
        # clipboard-copy=Control+Shift+c XF86Copy
        # clipboard-paste=Control+Shift+v XF86Paste
        # primary-paste=Shift+Insert
        # search-start=Control+Shift+r
        # font-increase=Control+plus Control+equal Control+KP_Add
        # font-decrease=Control+minus Control+KP_Subtract
        # font-reset=Control+0 Control+KP_0
        # spawn-terminal=Control+Shift+n
        # minimize=none
        # maximize=none
        # fullscreen=none
        # pipe-visible=[sh -c "xurls | fuzzel | xargs -r firefox"] none
        # pipe-scrollback=[sh -c "xurls | fuzzel | xargs -r firefox"] none
        # pipe-selected=[xargs -r firefox] none
        # show-urls-launch=Control+Shift+o
        # show-urls-copy=none
        # show-urls-persistent=none
        # prompt-prev=Control+Shift+z
        # prompt-next=Control+Shift+x
        # unicode-input=Control+Shift+u
        # noop=none
      };
      search-bindings = {
        # cancel=Control+g Control+c Escape
        # commit=Return
        # find-prev=Control+r
        # find-next=Control+s
        # cursor-left=Left Control+b
        # cursor-left-word=Control+Left Mod1+b
        # cursor-right=Right Control+f
        # cursor-right-word=Control+Right Mod1+f
        # cursor-home=Home Control+a
        # cursor-end=End Control+e
        # delete-prev=BackSpace
        # delete-prev-word=Mod1+BackSpace Control+BackSpace
        # delete-next=Delete
        # delete-next-word=Mod1+d Control+Delete
        # extend-to-word-boundary=Control+w
        # extend-to-next-whitespace=Control+Shift+w
        # clipboard-paste=Control+v Control+Shift+v Control+y XF86Paste
        # primary-paste=Shift+Insert
        # unicode-input=none
      };
      url-bindings = {
        # cancel=Control+g Control+c Control+d Escape
        # toggle-url-visible=t
      };
      text-bindings = {
        # \x03=Mod4+c  # Map Super+c -> Ctrl+c
      };
      mouse-bindings = {
        # selection-override-modifiers=Shift
        # primary-paste=BTN_MIDDLE
        # select-begin=BTN_LEFT
        # select-begin-block=Control+BTN_LEFT
        # select-extend=BTN_RIGHT
        # select-extend-character-wise=Control+BTN_RIGHT
        # select-word=BTN_LEFT-2
        # select-word-whitespace=Control+BTN_LEFT-2
        # select-row=BTN_LEFT-3
        # vim: ft=dosini
      };
    };
  };
}
