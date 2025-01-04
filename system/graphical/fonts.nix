{
  config,
  pkgs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.geist-mono
      nerd-fonts.symbols-only
      noto-fonts-emoji
      tlwg
    ];
    fontconfig = {
      defaultFonts = {
        sansSerif = ["GeistMono Nerd Font Propo"];
        serif = ["GeistMono Nerd Font Propo"];
        monospace = ["GeistMono Nerd Font Mono"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
