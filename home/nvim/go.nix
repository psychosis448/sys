{
  config,
  pkgs,
  ...
}: {
  programs.go = let
    h = config.home.homeDirectory;
  in {
    enable = true;
    goBin = "${h}/.local/gobin";
    goPath = "${h}/.go";
    telemetry.mode = "off";
  };

  ## https://www.lazyvim.org/extras/lang/go
  programs.neovim = {
    extraPackages = with pkgs; [
      gofumpt
      gopls
      gomodifytags
      impl
    ];
    plugins = with pkgs.vimPlugins; [
      nvim-dap-go
      neotest-golang
    ];
  };
}
