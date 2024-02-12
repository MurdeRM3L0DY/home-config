{
  description = "Home Manager Configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mnix = {
      url = "path:/home/nemesis/src/mnix";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    neovim = {
      url = "github:neovim/neovim/2fce95ec439a1121271798cf00fc8ec9878813fa/?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixd = {
      url = "github:nix-community/nixd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions/78a4ac458e84b92990f985b91a82d452f03e55b6";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
    nixgl = {
      url = "github:guibou/nixGL";
    };
  };

  # sources
  inputs = {
    awesome-src = {
      url = "github:awesomeWM/awesome";
      flake = false;
    };
    picom-ft-labs-src = {
      url = "github:FT-Labs/picom";
      flake = false;
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    mnix,
    flake-utils,
    ...
  }: let
    username = "nemesis";
    system = flake-utils.lib.system.x86_64-linux;
  in {
    homeConfigurations."${username}" = mnix.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = [
          inputs.nur.overlay
          inputs.nixgl.overlay
        ];
      };

      modules = [./home.nix];

      extraInputs = {
        inherit inputs;
      };
    };
  };
}