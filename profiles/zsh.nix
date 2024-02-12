{profiles, ...}: {
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

  home.file.".zshenv" = config.lib.remotefiles.symlink "files" "zsh/.zshenv";
  home.file.".zprofile" = config.lib.remotefiles.symlink "files" "zsh/.zprofile";
  home.file.".zshrc" = config.lib.remotefiles.symlink "files" "zsh/.zshrc";
  home.file.".zsh" = config.lib.remotefiles.symlink "files" "zsh/.zsh";

  xdg.configFile."zellij/config.kdl" = config.lib.remotefiles.symlink "files" "zellij/.config/zellij/config.kdl";
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
