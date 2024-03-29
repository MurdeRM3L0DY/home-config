{inputs, ...}: {...}: {
  # dconf
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      disable-while-typing = false;
      natural-scroll = false;
    };
    # "org/gnome/desktop/peripherals/keyboard" = {
    #   repeat-interval = 40;
    #   delay = 160;
    # };
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 10;
      audible-bell = false;
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      switch-to-workspace-6 = ["<Super>6"];
      switch-to-workspace-7 = ["<Super>7"];
      switch-to-workspace-8 = ["<Super>8"];
      switch-to-workspace-9 = ["<Super>9"];
      switch-to-workspace-10 = ["<Super>0"];
      close = ["<Super>q"];

      move-to-workspace-1 = ["<Super><Shift>1"];
      move-to-workspace-2 = ["<Super><Shift>2"];
      move-to-workspace-3 = ["<Super><Shift>3"];
      move-to-workspace-4 = ["<Super><Shift>4"];
      move-to-workspace-5 = ["<Super><Shift>5"];
      move-to-workspace-6 = ["<Super><Shift>6"];
      move-to-workspace-7 = ["<Super><Shift>7"];
      move-to-workspace-8 = ["<Super><Shift>8"];
      move-to-workspace-9 = ["<Super><Shift>9"];
      move-to-workspace-10 = ["<Super><Shift>0"];
    };
    "org/gnome/shell/keybindings" = {
      # Remove the default hotkeys for opening favorited applications.
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
      switch-to-application-6 = [];
      switch-to-application-7 = [];
      switch-to-application-8 = [];
      switch-to-application-9 = [];
      switch-to-application-10 = [];
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      # panel-length = ''{"0": 100}'';
      # panel-positions = ''{"0": "BOTTOM"}'';
      # panel-sizes = ''{"0": 36}'';
    };
    "org/gnome/desktop/input-sources" = {
      xkb-options = ["terminate:ctrl_alt_bksp" "caps:swapescape"];
    };
  };
}
