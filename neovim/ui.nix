_inputs: {
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
  ];
  plugins.barbar.enable = true;
}
