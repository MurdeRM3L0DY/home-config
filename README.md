## setup
```bash
git clone --recursive https://github.com/MurdeRM3L0DY/home-config.git "${XDG_CONFIG_HOME:-"$HOME/.config"}/home-manager"
```

- update `username` and `system` in `flake.nix` appropriately

```bash
nix run home-manager/master -- switch
```
