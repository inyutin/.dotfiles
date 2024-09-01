{
  config,
  pkgs,
  ...
}: {
  home.username = "dmitry";
  home.homeDirectory = "/home/dmitry";

  home.language.base = "en-GB.UTF-8";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.awscli2
    pkgs.aws-sso-cli
    pkgs.carapace # Provides argument completion for multiple CLI commands
    pkgs.zoxide # A smarter cd command
    pkgs.nixd # Nix Language Server
    pkgs.alejandra # Nix Language Server
    pkgs.pyenv # Simple Python version management
  ];

  home.file = {};

  home.sessionVariables = {};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Disable news notification
  news.display = "silent";
}
