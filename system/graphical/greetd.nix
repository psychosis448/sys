{
  config,
  pkgs,
  ...
}: {
  ## NOTE: start hyprland on session login
  ##       hyprland itself is managed by home-manager
  # environment.systemPackages = [pkgs.hyprland];
  environment.systemPackages = [pkgs.greetd.greetd];
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd ${pkgs.hyprland}/bin/Hyprland";
        user = "greeter";
      };
    };
  };
}
