{ pkgs, ... }: {
  keymaps = [
    {
      action = "<Cmd>Lspsaga finder def+ref+imp<CR>";
      key = "<Leader>lf";
      mode = "n";
      options.desc = "LSP: Open <Define & Using [f]inder>";
    }
    {
      action = "<Cmd>Lspsaga peek_definition<CR>";
      key = "<Leader>lgp";
      mode = "n";
      options.desc = "LSP: [g]o to Definition with '[p]eek'";
    }
    {
      action = "<Cmd>Lspsaga goto_definition<CR>";
      key = "<Leader>lgg";
      mode = "n";
      options.desc = "LSP: [g]o to Definition";
    }
    {
      action = "<Cmd>Lspsaga hover_doc<CR>";
      key = "<Leader>ld";
      mode = "n";
      options.desc = "LSP: Open [d]ocumemt on Cursor";
    }
    {
      action = "<Cmd>Lspsaga rename auto_save=true<CR>";
      key = "<Leader>lr";
      mode = "n";
      options.desc = "LSP: [r]ename Symbol on Cursor";
    }
    {
      action = "<Cmd>Lspsaga code_action<CR>";
      key = "<Leader>la";
      mode = "n";
      options.desc = "LSP: Run Code [a]ctions";
    }
  ];

  plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd = {
          enable = true;
          settings = {
            options = {
              home-manager = {
                expr = ''
                  (builtins.getFlake "/home/nixos/dotfiles").homeConfigurations."nixos".options'';
              };
              nixvim = {
                expr = ''
                  (builtins.getFlake "/home/nixos/dotfiles").homeConfigurations."nixos".options.programs.nixvim.type.getSubOptions []
                '';
              };
            };
          };
        };
        nushell.enable = true;
        yamlls.enable = true;
        starlark_rust.enable = true;
        pyright.enable = true;
      };
    };

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [ { name = "nvim_lsp"; } { name = "luasnip"; } ];
      settings.mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      };
      settings.snippet.expand = {
        __raw = ''
          function(args)
              require('luasnip').lsp_expand(args.body)
          end
        '';
      };

    };

    none-ls = {
      enable = true;
      sources.formatting = {
        nixfmt.enable = true;
        biome.enable = true;
        yamlfmt.enable = true;
      };
    };
    lsp-format.enable = true;

    luasnip.enable = true;

    rustaceanvim = {
      enable = true;
      settings.server.default_settings.rust-analyzer.files.excludeDirs =
        [ ".direnv" ];
    };

    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        incremental_selection.enable = true;
        indent.enable = true;
      };
    };

    lspkind.enable = true;

    fidget.enable = true;

    lspsaga = { enable = true; };

    trouble.enable = true;
  };
}
