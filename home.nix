{ config, pkgs, ... }@inputs:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
  imports = [ ./share.nix ];
}
