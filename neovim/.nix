_inputs: {
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
      };

      globals = { mapleader = " "; };

      imports = [ ./lsp.nix ./filer.nix ];
    };
  };
}
