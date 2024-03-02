{
  inputs,
  profiles,
  lib',
  ...
}: {
  config,
  pkgs,
  ...
}: {
  fonts.fontconfig = {
    enable = true;
  };

  xdg.dataFile."fonts" = lib'.dotfileslink config "fonts/.local/share/fonts";
}
