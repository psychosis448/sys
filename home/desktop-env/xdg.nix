{config, ...}: {
  xdg = let
    h = config.home.homeDirectory;
  in {
    configHome = "${h}/.config";
    dataHome = "${h}/.local/share";
    stateHome = "${h}/.local/state";
    cacheHome = "${h}/.cache";
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
      documents = "${h}/doc";
      download = "${h}/dls";
      music = "${h}/aud";
      pictures = "${h}/img";
      publicShare = "${h}/shr";
      templates = "${h}/tpl";
      videos = "${h}/vid";
      extraConfig = {
        XDG_BIB_DIR = "${h}/bib";
        XDG_ORG_DIR = "${h}/org";
        XDG_PROJECT_DIR = "${h}/prj";
      };
    };
    # https://wiki.archlinux.org/title/XDG_MIME_Applications
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "org.firefox.firefox.desktop";
      };
    };
  };
  home.sessionVariables = {
    XDG_CONFIG_HOME = "${config.xdg.configHome}";
    XDG_STATE_HOME = "${config.xdg.stateHome}";
    XDG_DATA_HOME = "${config.xdg.dataHome}";
    XDG_CACHE_HOME = "${config.xdg.cacheHome}";
  };
}
