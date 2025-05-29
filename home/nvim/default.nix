{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./go.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.neovim = {
    defaultEditor = true;
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      ## lsps
      lua-language-server
      marksman
      nil
      nixd

      ## linters
      markdownlint-cli2

      ## formatters
      prettierd
      alejandra
    ];
    plugins = with pkgs.vimPlugins; [
      ## NOTE: LazyVim plugins used
      LazyVim
      lazy-nvim

      ## coding
      blink-cmp
      # nvim-snippets
      friendly-snippets
      mini-pairs
      ts-comments-nvim
      mini-ai
      lazydev-nvim

      ## colorscheme
      modus-themes-nvim

      ## editor
      neo-tree-nvim
      grug-far-nvim
      flash-nvim
      which-key-nvim
      gitsigns-nvim
      trouble-nvim
      todo-comments-nvim

      ## formatting
      conform-nvim

      ## linting
      nvim-lint

      ## lsp
      nvim-lspconfig

      ## treesitter
      nvim-treesitter.withAllGrammars
      nvim-treesitter-textobjects
      nvim-treesitter-context
      nvim-ts-autotag

      ## ui
      lualine-nvim
      noice-nvim
      mini-icons
      nui-nvim
      snacks-nvim

      ## util
      plenary-nvim
      persistence-nvim

      ## NOTE: LazyVim extras

      ## fzf-lua
      fzf-lua

      ## mini
      mini-surround

      ## markdown
      markdown-preview-nvim
      render-markdown-nvim

      ## NOTE: Additional plugins

      ## neogit
      neogit
      diffview-nvim

      ## orgmode
      orgmode
      org-roam-nvim
    ];

    extraLuaConfig = ''
      vim.g.mapleader = " " -- Need to set leader before lazy for correct keybindings
      require("lazy").setup({
        spec = {
          -- add LazyVim and import its plugins
          { "LazyVim/LazyVim", import = "lazyvim.plugins" },
          { import = "lazyvim.plugins.extras.coding.mini-surround" },
          { import = "lazyvim.plugins.extras.lang.markdown" },
          { import = "lazyvim.plugins.extras.lang.go" },
          { import = "lazyvim.plugins.extras.lang.nix" },
          -- import/override with your plugins
          { import = "plugins" },
        },
        dev = {
          path = "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
          patterns = {""},
        },
        performance = {
          -- Used for NixOS
          reset_packpath = false,
          rtp = {
            reset = false,
            disabled_plugins = {
              "gzip",
              -- "matchit",
              -- "matchparen",
              -- "netrwPlugin",
              "tarPlugin",
              "tohtml",
              "tutor",
              "zipPlugin",
            },
          }
        },
        defaults = {
          -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
          -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
          lazy = false,
          -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
          -- have outdated releases, which may break your Neovim install.
          version = false, -- always use the latest git commit
          -- version = "*", -- try installing the latest stable version for plugins that support semver
        },
        install = {
          -- Safeguard in case we forget to install a plugin with Nix
          missing = false,
        },
      })
    '';
  };

  xdg.configFile."nvim/lua" = {
    recursive = true;
    source = ./lua;
  };
}
