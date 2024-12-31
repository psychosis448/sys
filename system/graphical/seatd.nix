{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.seatd];

  users.groups.seat = {};

  systemd.services.seatd = {
    enable = true;
    unitConfig = {
      Description = "Seat management daemon";
      Documentation = "man:seatd(1)";
    };
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.seatd}/bin/seatd -g seat";
      Restart = "always";
      RestartSec = 1;
    };
    wantedBy = ["multi-user.target"];
  };
}
