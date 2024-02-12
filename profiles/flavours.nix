{inputs, ...}: {
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    flavours
  ];

  # flavours
  xdg.configFile."flavours" = config.lib.remotefiles.symlink "files" "flavours/.config/flavours";
}
