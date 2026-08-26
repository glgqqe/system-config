{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com";
      
      logo = {
        source = "nixos_small";
      };

      modules = [
        "title"
        "os"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "wm"
        "terminal"
        "memory"
      ];
    };
  };
}
