_inputs: {
  programs.git = {
    enable = true;
    extraConfig = {
      user.email = "souyakoji@gmail.com";
      user.name = "sakura-aoi-ororora";
    };
    ignores = [
      ".envrc" # for flake direnv
      ".direnv"
      "sand"
    ];
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.gh-dash = { enable = true; };

  programs.lazygit.enable = true;
}
