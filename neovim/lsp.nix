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
      settings.source = [ { name = "nvim_lsp"; } { name = "luasnip"; } ];
      settings.mapping = {
        __raw = ''
          require("cmp").mapping.preset.insert({
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<CR>'] = cmp.mapping.confirm({ secret = true }),
                 })
        '';
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
      sources.formatting = { nixfmt.enable = true; };
    };
    lsp-format.enable = true;

    luasnip.enable = true;
  };
}
