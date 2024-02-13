{
  inputs,
  profiles,
  modules,
  ...
}: {
  config,
  pkgs,
  ...
}: let
  userProfiles = inputs.mnix.lib.importDefault {
    src = ./profiles;
    inputs = {
      inherit inputs profiles modules;
    };
  };
in {
  imports = with userProfiles; [
    kitty
    theme
    flavours
    # awesome
    hyprland
    chromium
    code
    zsh
    git
    fonts
    # dconf
    neovim
    firefox
  ];

  home.stateVersion = "23.11";

  targets.genericLinux = {
    enable = pkgs.hostPlatform.isLinux;
  };

  programs.home-manager = {
    enable = true;
  };

  programs.man = {
    enable = true;
  };

  xdg = {
    enable = true;
    mime = {
      enable = true;
    };
    # portal = {
    #   enable = true;
    # };
    userDirs = {
      enable = true;
    };
  };

  news.display = "silent";

  home.packages = with pkgs; [
    # bottles
    # bitwig-studio
    # deadbeef-with-plugins
    # hyprland
    # jamesdsp
    libreoffice
    mate.atril
    mullvad-browser
    nixgl.nixGLMesa
    qbittorrent
    # tribler
  ];

  xdg.systemDirs = {
    config = ["/etc/xdg"];
    data = ["/var/lib/flatpak/exports/share" "${config.xdg.dataHome}/flatpak/exports/share"];
  };
}
