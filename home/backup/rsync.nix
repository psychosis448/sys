{pkgs, ...}: {
  home.packages = with pkgs; [
    # https://ryantm.github.io/nixpkgs/builders/trivial-builders/#trivial-builder-writeShellApplication
    (writeShellApplication {
      name = "backup";
      runtimeInputs = [rsync];
      text = builtins.readFile ./backup.sh;
    })
  ];

  home.file = {
    ".config/rsync/rsyncinclude" = {
      source = ./rsyncinclude;
    };
  };
  home.file = {
    ".config/rsync/rsyncexclude" = {
      source = ./rsyncexclude;
    };
  };
}
