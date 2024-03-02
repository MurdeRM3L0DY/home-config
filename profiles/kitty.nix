{lib', ...}: {
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # kitty
  ];

  xdg.configFile."kitty" = lib'.dotfileslink config "kitty/.config/kitty";
}
