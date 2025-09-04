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
    pkgs.alejandra # The Uncompromising Nix Code Formatter
    pkgs.awscli2 # Unified tool to manage your AWS services
    pkgs.carapace # Provides argument completion for multiple CLI commands
    pkgs.direnv # Shell extension that manages your environment
    pkgs.lazygit # A simple, fast and powerful Git UI
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
