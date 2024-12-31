{...}: {
  ## https://github.com/eza-community/eza
  programs.eza = {
    # colors = null;
    enable = true;
    ## https://github.com/eza-community/eza?tab=readme-ov-file#command-line-options
    extraOptions = [
      "--long"
    ];
    git = true;
    icons = "auto";
  };
}
