{
  inputs,
  super,
  profiles,
  utils,
  ...
}: {
  config,
  pkgs,
  lib,
  ...
}: {
  imports = with super; [
  ];

  home.packages = with pkgs; [
  ];

  xdg.configFile."hypr" = utils.dotfileslink config "hypr/.config/hypr";
  xdg.configFile."ags" = utils.dotfileslink config "ags/.config/ags";
}
