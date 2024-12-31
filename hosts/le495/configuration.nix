{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ## NOTE: modules for graphical-system with
    ##       container-engine & virtualisation enabled
    ../../system/base
    ../../system/graphical
    ../../system/libvirt.nix

    ./disko-configuration.nix
    ./hardware-configuration.nix
  ];

  ## FIXME: unfree packages must be declared here
  ##       no possible in e.g. ../../nixos/graphical/printing.nix
  programs.steam.enable = true;
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "samsung-UnifiedLinuxDriver"
      "spotify"
      "steam"
      "steam-unwrapped"
      "steam-original"
      "steam-run"
    ];

  ## NOTE: nix base configuration
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  ## NOTE: bootloader configuration
  ##       uses systemd-boot efi boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ## vpn
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

  ## NOTE: networking configuration
  networking.hostName = "agares";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  ## NOTE: define a user account
  ##       don't forget to set a password with ‘passwd’
  programs.zsh.enable = true;
  users = {
    users = {
      user = {
        extraGroups = ["wheel" "video" "seat" "keyd"];
        initialPassword = "pw";
        isNormalUser = true;
        shell = pkgs.zsh;
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
