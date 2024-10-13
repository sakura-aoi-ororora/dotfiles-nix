_inputs: {
  keymaps = [{
    action = "<Cmd>LazyGit<CR>";
    key = "<Leader>gg";
    mode = "n";
    options.desc = "Git: Open Lazy [g]it";
  }];
  plugins.lazygit = { enable = true; };
}
