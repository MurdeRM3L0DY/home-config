{
  inputs,
  profiles,
  ...
}: {
  config,
  pkgs,
  ...
}: {
  fonts.fontconfig = {
    enable = true;
  };

  xdg.dataFile."fonts" = config.lib.remotefiles.symlink "files" "fonts/.local/share/fonts";
}
