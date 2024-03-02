{
  inputs,
  super,
  profiles,
  lib',
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

  xdg.configFile."hypr" = lib'.dotfileslink config "hypr/.config/hypr";
  xdg.configFile."ags" = lib'.dotfileslink config "ags/.config/ags";
}
