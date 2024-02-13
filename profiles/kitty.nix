{...}: {
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # kitty
  ];

  xdg.configFile."kitty" = config.lib.remotefiles.symlink "files" "kitty/.config/kitty";
}
