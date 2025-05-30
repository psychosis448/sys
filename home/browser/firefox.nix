{
  config,
  pkgs,
  ...
}: {
  # https://mynixos.com/home-manager/options/programs.firefox
  # Set session variables
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
  };
  # https://www.youtube.com/watch?v=1K4zglgvk7Q
  # https://github.com/mbnuqw/sidebery
  programs.firefox = {
    enable = true;
    profiles.psychosis448 = {
      # https://mynixos.com/home-manager/option/programs.firefox.profiles.%3Cname%3E.bookmarks
      # bookmarks = [
      #   {
      #     name = "mynixos";
      #     tags = ["nixos"];
      #     keyword = "nixos";
      #     url = "https://mynixos.com/";
      #   }
      #   {
      #     name = "Go Programming";
      #     toolbar = true;
      #     bookmarks = [
      #       {
      #         name = "Go Language Spec";
      #         tags = ["go" "spec"];
      #         keyword = "go spec";
      #         url = "https://go.dev/ref/spec";
      #       }
      #       {
      #         name = "Go Standard Library";
      #         tags = ["go" "std"];
      #         keyword = "go standard library";
      #         url = "https://pkg.go.dev/std";
      #       }
      #     ];
      #   }
      # ];
    };
    # TODO: add nur https://github.com/nix-community/NUR
    # https://nur.nix-community.org/
    # extensions = [ nur.repos.rycee.firefox-addons.jabref ];
  };
}
