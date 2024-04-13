{profiles, utils, ...}: {
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
    fswatch
    htop
    luarocks
    nix-index
    p7zip
    testdisk
    tree
    unzip
    vpnc
    zip
    zoxide
  ];

  home.file.".zshenv" = utils.dotfileslink config "zsh/.zshenv";
  home.file.".zprofile" = utils.dotfileslink config "zsh/.zprofile";
  home.file.".zshrc" = utils.dotfileslink config "zsh/.zshrc";
  home.file.".zsh" = utils.dotfileslink config "zsh/.zsh";

  xdg.configFile."zellij/config.kdl" = utils.dotfileslink config "zellij/.config/zellij/config.kdl";
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
      python_venv_auto_create = true;
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
