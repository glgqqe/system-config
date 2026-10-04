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
    ./modules/vim.nix
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

    sessionVariables = {
      LANG = "en_US.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };

    packages = with pkgs; [
      firefox
      spotify
      spotifyd
      kitty
      telegram-desktop
      nautilus
      xarchiver
      scrcpy
      libsForQt5.qt5ct
      kdePackages.qt6ct
      prismlauncher
      snapshot
      blanket
      discord-rpc
      adwsteamgtk
      libreoffice
      nocturne
      obs-studio
      opencode
      ansible
      musescore
      qbittorrent
    ];
  };

  programs.discord = {
  	enable = true;
  	package = pkgs.discord.override {
  		withVencord = true;
  	};
  };
  services.spotifyd = {
  	enable = true;
  	settings = {
  		global = {
  			use_mpris = true;
  			initial_volume = 50;
  		};
  	};
  };

}
