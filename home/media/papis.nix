{config, ...}: {
  programs.papis = {
    enable = true;
    libraries.bib = {
      isDefault = true;
      name = "bib";
      settings = {
        dir = "${config.xdg.userDirs.extraConfig.XDG_BIB_DIR}";
      };
    };
    ## https://papis.readthedocs.io/en/latest/configuration.html
    settings = {
    };
  };
}
