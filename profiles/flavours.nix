{inputs, utils, ...}: {
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    flavours
  ];

  # flavours
  xdg.configFile."flavours" = utils.dotfileslink config "flavours/.config/flavours";
}
