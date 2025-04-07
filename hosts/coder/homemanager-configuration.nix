{pkgs, ...}: {
  imports = [
    ../../home/desktop-env/fonts.nix
    ../../home/git
    ../../home/nvim
    ../../home/shell
  ];
  home = {
    username = "coder";
    homeDirectory = "/home/coder";
  };
  home.stateVersion = "24.05";
}
