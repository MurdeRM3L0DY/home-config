{
  inputs,
  profiles,
  utils,
  ...
}: {
  config,
  pkgs,
  ...
}: {
  fonts.fontconfig = {
    enable = true;
  };

  xdg.dataFile."fonts" = utils.dotfileslink config "fonts/.local/share/fonts";
}
