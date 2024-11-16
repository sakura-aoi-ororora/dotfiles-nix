{ pkgs, ... }: {
  globals = {
    # disable netrw
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
  };

  keymaps = [
    {
      action = "<Cmd>Neotree float toggle reveal<CR>";
      key = "<Leader>ft";
      mode = "n";
      options.desc = "File: Open [f]ile [t]ree";
    }
    {
      action = "<Cmd>Telescope find_files theme=dropdown<CR>";
      key = "<Leader>ff";
      mode = "n";
      options.desc = "File: Open [f]ile [f]inder";
    }
    {
      action = "<Cmd>Telescope live_grep theme=dropdown<CR>";
      key = "<Leader>fg";
      mode = "n";
      options.desc = "File: Open [f]ile [g]rep";
    }
  ];

  plugins = {
    neo-tree = {
      enable = true;
      closeIfLastWindow = true;
      filesystem = {
        filteredItems = {
          hideDotfiles = false;
          hideGitignored = false;
          hideByName = [ ".git" ];
        };

        followCurrentFile.enabled = true;
        followCurrentFile.leaveDirsOpen = true;
      };
    };
    web-devicons.enable = true;

    telescope = {
      enable = true;
      extensions.fzf-native.enable = true;
    };

    gitsigns.enable = true;
  };

  extraPackages = with pkgs; [ ripgrep ];
}
