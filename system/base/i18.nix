{...}: {
  ## NOTE: set timezone
  time.timeZone = "Europe/Berlin";

  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    ## NOTE: required so that weeks start on monday's
    "en_DK.UTF-8/UTF-8"
  ];
}
