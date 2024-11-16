{ pkgs, ... }: {
  keymaps = [
    {
      action = "<Cmd>BufferPrevious<CR>";
      key = "<Leader>u,";
      mode = "n";
      options.desc = "UI: Choose Previous (<)";
    }
    {
      action = "<Cmd>BufferNext<CR>";
      key = "<Leader>u.";
      mode = "n";
      options.desc = "UI: Choose Next (>)";
    }
    {
      action = "<Cmd>BufferCloseAllButCurrent<CR>";
      key = "<Leader>ua";
      mode = "n";
      options.desc = "UI: Close [a]ll Buffers";
    }
    {
      action = "<Cmd>ZenMode<CR>";
      key = "<Leader>uz";
      mode = "n";
      options.desc = "UI: On/Off [z]en Mode";
    }
  ];
  plugins.barbar.enable = true;

  plugins.lualine = {
    enable = true;
    settings.options.theme = "OceanicNext";
  };

  plugins.zen-mode = {
    enable = true;
    settings.window = { width = 80; };
  };

  plugins.notify.enable = true;
  plugins.noice.enable = true;

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
