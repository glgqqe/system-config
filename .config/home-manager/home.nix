{ config, pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;
  gtk.enable = true;
  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };
  
  imports = [
    inputs.niri.homeModules.niri
    ./modules/niri.nix
    ./modules/zsh/zsh.nix
    ./modules/kitty.nix
    ./modules/fastfetch.nix
  ];

  xdg.configFile."noctalia/settings.toml".text = ''
      [theme.templates]
      enable_builtin_templates = true
      builtin_ids = [ "niri", "kitty", "gtk3", "gtk4" ]
    '';

  home = {
    username = "glg";
    homeDirectory = "/home/glg";
    stateVersion = "26.05";

    pointerCursor = {
    	enable = true;
    	name = "macOS";
    	package = pkgs.apple-cursor;
    	size = 24;
    	gtk.enable = true;
    	x11.enable = true;
    };

    packages = with pkgs; [
      spotify
      kitty
      telegram-desktop
      firefox
      thunar
      xarchiver
      scrcpy
      libsForQt5.qt5ct
      kdePackages.qt6ct
      prismlauncher
      snapshot
      steam
      blanket
    ];
  };

  programs.discord = {
  	enable = true;
  	package = pkgs.discord.override {
  		withVencord = true;
  	};
  };
}
