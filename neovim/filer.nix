_inputs: {
  globals = {
    # disable netrw
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
  };

  keymaps = [{
    action = "<Cmd>Neotree float toggle<CR>";
    key = "<Leader>ft";
    mode = "n";
    options.desc = "File: Open [f]ile [t]ree";
  }];

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
      };
    };
    web-devicons.enable = true;
  };
}
