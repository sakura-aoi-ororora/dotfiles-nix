_inputs: {
  programs.git = {
    enable = true;
    extraConfig = {
      user.email = "souyakoji@gmail.com";
      user.name = "sakura-aoi-ororora";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.gh-dash = { enable = true; };
}
