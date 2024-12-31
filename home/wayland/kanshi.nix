{pkgs, ...}: {
  home.packages = with pkgs; [kanshi];
  services.kanshi = {
    enable = true;
    ## NOTE: systemdTarget defined in windowmanager overlay
    ## TODO: profiles is deprecated, use settings instead
    ## https://mynixos.com/home-manager/option/services.kanshi.settings
    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
          }
        ];
      }
      {
        profile.name = "docked-opened";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            position = "0,0";
          }
          {
            criteria = "Eizo Nanao Corporation EV2795 23375090";
            status = "enable";
            position = "1920,0";
          }
          {
            criteria = "Eizo Nanao Corporation EV2795 23335090";
            status = "enable";
            position = "4480,0";
            transform = "90";
          }
        ];
      }
      {
        profile.name = "docked-closed";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "Eizo Nanao Corporation EV2795 23375090";
            status = "enable";
            position = "0,0";
          }
          {
            criteria = "Eizo Nanao Corporation EV2795 23335090";
            status = "enable";
            position = "2560,0";
            transform = "90";
          }
        ];
      }
      {
        profile.name = "hdmi";
        profile.outputs = [
          {
            criteria = "eDP-1";
          }
          {
            criteria = "HDMI-A-1";
          }
        ];
      }
    ];
  };
}
