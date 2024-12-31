{pkgs, ...}: {
  imports = [
    ## NOTE: bluetooth & bluetooth-audio
    ./bluetooth.nix
    ./fonts.nix
    ./greetd.nix
    ./ios.nix
    ./iwd.nix
    ./pipewire.nix
    ./printing.nix
    ./seatd.nix
    ./udisks.nix
    ./upower.nix
    ./wayland-portal.nix
    ./waylock.nix
  ];

  ## NOTE: enable graphics
  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    xdg-utils
    libnotify
    wl-clipboard
  ];
}
