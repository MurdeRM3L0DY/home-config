{profiles, lib', ...}: {
  config,
  pkgs,
  ...
}: {
  imports = with profiles; [
    (tools.direnv {})
  ];

  home.packages = with pkgs; [
    bear
    fd
    htop
    nix-index
    p7zip
    testdisk
    tree
    unzip
    vpnc
    zip
  ];

  home.file.".zshenv" = lib'.dotfileslink config "zsh/.zshenv";
  home.file.".zprofile" = lib'.dotfileslink config "zsh/.zprofile";
  home.file.".zshrc" = lib'.dotfileslink config "zsh/.zshrc";
  home.file.".zsh" = lib'.dotfileslink config "zsh/.zsh";

  xdg.configFile."zellij/config.kdl" = lib'.dotfileslink config "zellij/.config/zellij/config.kdl";
  programs.zellij = {
    enable = true;
  };

  # programs.zsh = {
  #   enable = true;
  # };

  programs.starship = {
    enable = true;
  };

  programs.mise = {
    enable = true;

    settings = {
      experimental = true;
    };
  };

  programs.eza = {
    enable = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.ripgrep = {
    enable = true;
  };
}
