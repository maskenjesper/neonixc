{
  config,
  inputs,
  ...
}: let
  utils = inputs.nixCats.utils;
in {
  imports = [
    inputs.nixCats.homeModule
  ];

  nixCats = {
    enable = true;
    nixpkgs_version = inputs.nixpkgs;
    addOverlays = [
      (utils.standardPluginOverlay inputs)
    ];
    packageNames = ["nixCats" "testCats"];

    luaPath = "${./dotfiles}";

    categoryDefinitions.replace = {pkgs, ...} @ packageDef: {
      lspsAndRuntimeDeps.general = with pkgs; [
        universal-ctags
        ripgrep

        fd
        zoxide
        fzf

        fish-lsp

        gopls
        gotools
        go-tools
        gccgo

        bash-language-server
        shfmt

        nix-doc
        nixd
        alejandra

        lua-language-server
        stylua

        elixir-ls

        dart

        yamlfmt
        yaml-language-server

        hyprls

        csharp-ls

        kdePackages.qtdeclarative

        openscad-lsp

        arduino-language-server

        clang
        clang-tools
        cmake-language-server
      ];

      startupPlugins.general = with pkgs.vimPlugins; [
        lze
        oil-nvim
        vim-repeat
        plenary-nvim
        nvim-web-devicons
        nvim-lspconfig
        markview-nvim
        gruvbox-nvim
        kanagawa-nvim
        neoscroll-nvim
      ];

      optionalPlugins.general = with pkgs.vimPlugins; [
        cmake-tools-nvim

        vim-fugitive
        gitsigns-nvim
        indent-o-matic
        zen-mode-nvim

        hologram-nvim
        indent-blankline-nvim
        obsidian-nvim

        telescope-fzf-native-nvim
        telescope-ui-select-nvim
        telescope-nvim

        snacks-nvim

        nvim-cmp
        luasnip
        friendly-snippets
        cmp_luasnip
        cmp-buffer
        cmp-path
        cmp-nvim-lua
        cmp-nvim-lsp
        cmp-cmdline
        cmp-nvim-lsp-signature-help
        cmp-cmdline-history
        lspkind-nvim

        nvim-treesitter-textobjects
        nvim-treesitter.withAllGrammars

        which-key-nvim

        dressing-nvim

        comment-nvim

        harpoon

        vim-tmux-navigator

        lualine-nvim

        nvim-tree-lua

        #lint
        nvim-lint

        #debug
        nvim-dap
        nvim-dap-ui
        nvim-dap-virtual-text

        #format
        conform-nvim
      ];

      environmentVariables.general = {
        ELIXIRLS = "${pkgs.elixir-ls}/lib/language-server.sh";
      };
    };

    packageDefinitions.replace = {
      nixCats = {pkgs, ...}: {
        settings = {
          aliases = ["vim"];
        };

        categories = {
          general = true;
          elixirlspath = "${pkgs.elixir-ls}/lib/language-server.sh";
        };
      };
      testCats = {pkgs, ...}: {
        settings = {
          wrapRc = false;
          unwrappedCfgPath = "${config.home.homeDirectory}/neonixc/modules/terminal/apps/nixCats/homeManager/dotfiles";
          aliases = ["tvim"];
        };

        categories = {
          general = true;
          elixirlspath = "${pkgs.elixir-ls}/lib/language-server.sh";
        };
      };
    };
  };
}
