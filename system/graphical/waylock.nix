{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.waylock];
  security.pam.services.waylock.text = ''
    # PAM configuration file for the waylock screen locker. By default, it includes
    # the 'login' configuration file (see /etc/pam.d/login)
    auth include login
  '';
}
