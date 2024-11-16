{ pkgs, ... }@inputs: {
  home.packages = with pkgs; [ vim-startuptime ];
  programs = {
    nixvim = {
      enable = true;
      defaultEditor = true;
      opts = {
        number = true;
        expandtab = true;
        tabstop = 4;
        shiftwidth = 4;
        softtabstop = 4;
        autoindent = true;
        smartindent = true;
        foldmethod = "expr";
        foldexpr = "v:lua.vim.treesitter.foldexpr()";
      };

      keymaps = [{
        action = "<Cmd>normal! ggVG<CR>";
        key = "aa";
        mode = "o";
        options = {
          silent = true;
          desc = "All Choose";
        };
      }];

      globals = { mapleader = " "; };

      plugins = {
        which-key.enable = true;
        markdown-preview.enable = true;
      };

      colorschemes.catppuccin.enable = true;

      performance = {
        byteCompileLua = {
          enable = true;
          configs = true;
          initLua = true;
          nvimRuntime = true;
          plugins = true;
        };
        combinePlugins = {
          enable = true;
          standalonePlugins = [ "nvim-treesitter" ];
          pathsToLink = [ "/copilot" ];
        };
      };

      imports = [
        ./lsp.nix
        ./filer.nix
        ./git.nix
        ./ui.nix
        ./modify.nix
        ./ai.nix
        ./test.nix
        ./dap.nix
      ];
    };
  };
}
