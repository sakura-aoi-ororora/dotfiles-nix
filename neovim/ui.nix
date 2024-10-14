{ pkgs, ... }: {
  keymaps = [
    {
      action = "<Cmd>BufferPrevious<CR>";
      key = "<Leader>b,";
      mode = "n";
      options.desc = "Buffer: Choose Previous (<)";
    }
    {
      action = "<Cmd>BufferNext<CR>";
      key = "<Leader>b.";
      mode = "n";
      options.desc = "Buffer: Choose Next (>)";
    }
    {
      action = "<Cmd>BufferCloseAllButCurrent<CR>";
      key = "<Leader>bc";
      mode = "n";
      options.desc = "Buffer: [c]lose Buffers";
    }
  ];
  plugins.barbar.enable = true;

  plugins.lualine = {
    enable = true;
    settings.options.theme = "OceanicNext";
  };

  extraPlugins = [{
    plugin = pkgs.vimUtils.buildVimPlugin {
      name = "hlchunk.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "shellRaining";
        repo = "hlchunk.nvim";
        rev = "ba6e2347177fec8ec6af4ae26d11a468c9e0ca72";
        sha256 = "sha256-Rx5kpjfpiH9i/IvOXx+wEWSO4gdfmXdhULDxbcBJQAY=";
      };
    };
    config = ''
      lua << EOF
      require("hlchunk").setup {
          chunk = {
              enable = true
          }
      }
      EOF
    '';
  }];
}
