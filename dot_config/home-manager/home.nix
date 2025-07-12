{pkgs, ...}: {
  home.username = "dmitry";
  home.homeDirectory = "/home/dmitry";

  home.language.base = "en-GB.UTF-8";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.awscli2
    pkgs.alejandra # Nix Language Server
    pkgs.aws-sso-cli
    pkgs.carapace # Provides argument completion for multiple CLI commands
    pkgs.gh # GitHub CLI
    pkgs.gh-copilot # GitHub Copilot CLI
    pkgs.nixd # Nix Language Server
    pkgs.pyenv # Simple Python version management
    pkgs.zoxide # A smarter cd command
  ];

  home.file = {};

  home.sessionVariables = {};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Disable news notification
  news.display = "silent";
}
