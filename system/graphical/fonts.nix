{
  config,
  pkgs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.geist-mono
      noto-fonts-emoji
      tlwg
    ];
    fontconfig = {
      defaultFonts = {
        # serif = ["Geist Nerd Font Propo"];
        # sansSerif = ["Geist Nerd Font Propo"];
        # monospace = ["Geist Nerd Font Mono"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
