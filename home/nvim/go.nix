{pkgs, ...}: {
  programs.go.enable = true;

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
