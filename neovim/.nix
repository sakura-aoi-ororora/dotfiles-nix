{ pkgs, ... }: {
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

      plugins = { which-key.enable = true; };

      extraPlugins = [
        (pkgs.vimUtils.buildVimPlugin {
          name = "vimdoc-ja";
          src = pkgs.fetchFromGitHub {
            owner = "vim-jp";
            repo = "vimdoc-ja";
            rev = "1e7738adca1a6f1751e21b999d0529451889bb78"; # 10/12/2024
            sha256 = "sha256-zSq7vVeJod++Js1fhT0qKndP0YTtH8wvNgocHXX34D8=";
          };
        })
      ];

      imports = [ ./lsp.nix ./filer.nix ./git.nix ];
    };
  };
}
