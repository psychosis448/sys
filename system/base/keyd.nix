{
  config,
  pkgs,
  ...
}: {
  # https://github.com/rvaiya/keyd#recommended-config
  environment.systemPackages = [pkgs.keyd];
  # users.groups = {keyd = {};};
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            rightalt = "layer(rightalt)";
          };
          rightalt = {
            a = "ä";
            o = "ö";
            u = "ü";
            s = "ß";
          };
          "rightalt+shift" = {
            a = "Ä";
            o = "Ö";
            u = "Ü";
            e = "€";
          };
        };
      };
    };
  };
}
