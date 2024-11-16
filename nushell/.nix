_inputs: {
  programs = {
    nushell = {
      enable = true;
      configFile.source = ./config.nu;
      envFile.source = ./env.nu;
    };

    # for nushell as main shell
    bash = {
      enable = true;
      initExtra = ''
         case $- in
        	 *i*) exec nu;;
               *) return;;
         esac
      '';
    };

    # for nushell in `nix develop`
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    # starship
    starship = {
      enable = true;
      settings = builtins.fromTOML (builtins.readFile ./starship.toml);
    };

    zoxide = { enable = true; };
  };
}
