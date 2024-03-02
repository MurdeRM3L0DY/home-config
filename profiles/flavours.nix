{inputs, lib', ...}: {
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    flavours
  ];

  # flavours
  xdg.configFile."flavours" = lib'.dotfileslink config "flavours/.config/flavours";
}
