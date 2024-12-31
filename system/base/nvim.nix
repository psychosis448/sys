{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim
  ];
  environment = {
    localBinInPath = true;
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      ALTERNATE = "nvim";
    };
  };
}
