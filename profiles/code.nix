{
  inputs,
  utils,
  ...
}: {
  config,
  pkgs,
  ...
}: let
  inherit (pkgs) system vscodium;
in {
  programs.vscode = {
    enable = true;
    package = vscodium;
    extensions = let
      extensions = inputs.nix-vscode-extensions.extensions.${system};
    in
      with extensions.vscode-marketplace; [
        ms-vsliveshare.vsliveshare
        ms-python.python
        ms-python.vscode-pylance
        llvm-vs-code-extensions.vscode-clangd
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        golang.go
        rust-lang.rust-analyzer
        slevesque.shader
        tamasfe.even-better-toml
        alefragnani.project-manager
        asvetliakov.vscode-neovim
        mesonbuild.mesonbuild
        # vscodevim.vim
      ];
  };

  # home.packages = with pkgs; [
  #   clang-tools
  # ];

  xdg.configFile."VSCodium" = utils.dotfileslink config "code/.config/VSCodium";
  xdg.configFile."Visual Studio Code" = utils.dotfileslink config "code/.config/Visual Studio Code";
}
