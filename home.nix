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
  username = "nemesis";
  homeDirectory = "/home/nemesis";

  userProfiles = inputs.mnix.lib.importDefault {
    src = ./profiles;
    inputs = {
      inherit inputs profiles modules;
    };
  };
in {
  imports =
    [
      {
        imports = [modules.remotefiles];
        home.remotefiles."files" = {
          type = "git";
          url = "https://github.com/MurdeRM3L0DY/dotfiles";
          path = ".config/home-manager/files";
        };
      }
    ]
    ++ (with userProfiles; [
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
      dconf
      neovim
      firefox
    ]);

  home.username = username;
  home.homeDirectory = homeDirectory;
  home.stateVersion = "23.11";

  programs.home-manager = {
    enable = true;
  };

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
    # strawberry
    # tribler
  ];

  programs.man = {
    enable = true;
  };

  xdg = {
    enable = true;
    mime = {
      enable = true;
    };
  };

  news.display = "silent";

  xdg.systemDirs = {
    config = ["/etc/xdg"];
    data = ["/var/lib/flatpak/exports/share" "${config.xdg.dataHome}/flatpak/exports/share"];
  };
}
