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
      ## NOTE: if you would integrate all these into org, they would be more inter-connected
      ##       especially if you use the inbox more like a day to day journal
      ##       and only move something to a project or a resource if it's really
      ##       destilled.
      ##       inbox / journal date entries should also include music
      ##       would be cool if one could add a playing stream or some audio
      ##       files within the org mode file
      ##       could write really cool notes about ones day
      ##       to create a vibe
      ##       especially interesting with videos / films that one watched that day
      ## TODO: must clean the involved directories first
      # documents = "${h}/doc"; # static documents
      # download = "${h}/dls"; # internet downloads
      # music = "${h}/aud"; # TODO: can be integrated into ~org?
      # pictures = "${h}/img"; # TODO: can be integrated into ~org?
      # publicShare = "${h}/shr";
      # templates = "${h}/tpl";
      # videos = "${h}/vid"; # TODO: can be integrated into ~org?
      # extraConfig = {
      #   XDG_BIB_DIR = "${h}/bib"; # TODO: can be integrated into ~org?
      #   XDG_ORG_DIR = "${h}/org";
      #   XDG_PROJECT_DIR = "${h}/prj"; # TODO: can be integrated into ~org?
      # };
      documents = "${h}/areas";
      download = "${h}/inbox";
      extraConfig = {
        XDG_ARCHIVES_DIR = "${h}/archives";
        XDG_PROJECTS_DIR = "${h}/projects";
        XDG_RESOURCES_DIR = "${h}/resources";
      };
      ## RESOURCES
      music = "${h}/resources/audio";
      pictures = "${h}/resources/images";
      publicShare = "${h}/resources/shared";
      templates = "${h}/resources/templates";
      videos = "${h}/resources/videos";
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
