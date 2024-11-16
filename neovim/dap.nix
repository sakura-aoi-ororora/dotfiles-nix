{ pkgs, ... }: {
  plugins.dap = {
    enable = true;
    extensions.dap-ui.enable = true;
  };
  extraPackages = [ pkgs.lldb_19 pkgs.codelldb ];
  keymaps = [
    {
      key = "<Leader>dd";
      action = ''<Cmd>DapContinue<CR><Cmd>lua require("dapui").open()<CR>'';
      mode = "n";
      options.desc = "DAP: Launch DAP";
    }
    {
      key = "<Leader>db";
      action = "<Cmd>DapToggleBreakpoint<CR>";
      mode = "n";
      options.desc = "DAP: Toggle [b]reakpoint";
    }
    {
      key = "<Leader>do";
      action = "<Cmd>DapStepOver<CR>";
      mode = "n";
      options.desc = "DAP: Step [o]ver";
    }
    {
      key = "<Leader>di";
      action = "<Cmd>DapStepInto<CR>";
      mode = "n";
      options.desc = "DAP: Step [i]nto";
    }
    {
      key = "<Leader>dc";
      action = ''<Cmd>lua require("dapui").close()<CR>'';
      mode = "n";
      options.desc = "DAP: [c]lose UI";
    }
  ];
}
