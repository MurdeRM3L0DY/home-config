extraInputs @ {
  inputs,
  profiles,
  modules,
  utils,
  ...
}: {
  config,
  pkgs,
  ...
}: let
  userProfiles = inputs.mnix.lib.importDefault {
    src = ./profiles;
    inputs = extraInputs;
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
    # android-studio
    bitwig-studio
    # deadbeef-with-plugins
    # hyprland
    # jamesdsp
    jetbrains.idea-community
    libreoffice
    mate.atril
    # mullvad-browser
    nixgl.nixGLMesa
    qbittorrent
    quarto
    remmina
    wireshark
    yabridge
    yabridgectl
    # tribler
  ];

  xdg.systemDirs = {
    config = ["/etc/xdg"];
    data = ["/var/lib/flatpak/exports/share" "${config.xdg.dataHome}/flatpak/exports/share"];
  };

  xdg.configFile."mpv" = utils.dotfileslink config "mpv/.config/mpv";
  xdg.configFile."wezterm" = utils.dotfileslink config "wezterm/.config/wezterm";
}
