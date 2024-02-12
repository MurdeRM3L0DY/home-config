{
  inputs,
  super,
  profiles,
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

  xdg.configFile."hypr" = config.lib.remotefiles.symlink "files" "hypr/.config/hypr";
  xdg.configFile."ags" = config.lib.remotefiles.symlink "files" "ags/.config/ags";
}
