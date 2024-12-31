{pkgs, ...}: {
  home.packages = with pkgs; [
    ## NOTE: used for importing & renaming
    rapid-photo-downloader
    ## NOTE: required for heif/heic handling in rapid-photo-downloader
    ## BUG: is currently broken
    ##      https://github.com/damonlynch/rapid-photo-downloader/issues/228
    # python312Packages.pyheif
    ## NOTE: used for viewing / sorting / deleting
    # digikam
    ## NOTE: used for developing
    darktable
    ## NOTE: used for editing
    gimp
    exiftool
  ];
}
