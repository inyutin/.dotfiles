{ config, pkgs, ... }:

{
  home.username = "dmitry";
  home.homeDirectory = "/home/dmitry";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.awscli2
    pkgs.aws-sso-cli
  ];

  home.file = {};

  home.sessionVariables = {};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
