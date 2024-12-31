{pkgs, ...}: {
  imports = [
    ./imv.nix
    ./nextcloud-client.nix
    ./screen-recording.nix
    ./photography.nix
    ./spotify.nix
    ./yt-dlp.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    mpv # video player
    ffmpeg # img/video manipulation
    pavucontrol # volume control
  ];
}
