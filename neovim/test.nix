_input: {
  plugins = {
    neotest = {
      enable = true;
      settings = {
        adapters = [''
          require('rustaceanvim.neotest')
        ''];
      };
    };
  };
}
