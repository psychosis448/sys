{pkgs, ...}: {
  home.packages = with pkgs; [
    nerd-fonts.geist-mono
    nerd-fonts.symbols-only
    noto-fonts-emoji
  ];
  fonts = {
    defaultFonts = {
      fontconfig = {
        sansSerif = ["GeistMono Nerd Font Propo"];
        serif = ["GeistMono Nerd Font Propo"];
        monospace = ["GeistMono Nerd Font Mono"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
