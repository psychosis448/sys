{
  config,
  pkgs,
  ...
}: {
  ## NOTE: required for keyd
  home.file.".XCompose".source = config.lib.file.mkOutOfStoreSymlink "${pkgs.keyd}/share/keyd/keyd.compose";
}
