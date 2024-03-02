{utils, ...}: {
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # kitty
  ];

  xdg.configFile."kitty" = utils.dotfileslink config "kitty/.config/kitty";
}
