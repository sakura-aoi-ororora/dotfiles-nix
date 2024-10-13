_inputs: {
  plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        nushell.enable = true;
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
    cmp-nvim-lsp.enable = true;
    cmp_luasnip.enable = true;

    none-ls = {
      enable = true;
      sources.formatting = { nixfmt.enable = true; };
    };
    lsp-format.enable = true;

    luasnip.enable = true;

    rustaceanvim.enable = true;

    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        incremental_selection.enable = true;
        indent.enable = true;
      };
    };
  };
}
