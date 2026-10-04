{
  description = "NixOS configuration with zapret-discord-youtube and AAGL";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, zapret-discord-youtube, aagl, ... }: {
    nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        
        zapret-discord-youtube.nixosModules.withTestTools
        {
          services.zapret-discord-youtube = {
            enable = true;
            configName = "general(ALT12)";
            gameFilter = "null";
            listGeneral = [ "modrinth.com" "rule34.xxx" ];
            ipsetAll = [ "192.168.1.0/24" "10.0.0.1" ];
            ipsetExclude = [ "203.0.113.0/24" ];
          };
        }
        
        aagl.nixosModules.default
        {
          nix.settings = aagl.nixConfig;
          programs.anime-game-launcher.enable = true;
        }
      ];
    };
  };
}
