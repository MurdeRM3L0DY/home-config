{
  dotfileslink = config: p: {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.xdg.configHome}/home-manager/files/${toString p}";
  };
}
