{ config, pkgs, lib, ... }:
{
  programs.niri = {
    enable = true;

    settings = {
      spawn-at-startup = [
        { command = [ "noctalia" ]; }
        { command = [ "spotifyd --initial-volume 50" ]; }
      ];
	  prefer-no-csd = true;
	  xwayland-satellite.enable = true; 
	  xwayland-satellite.path = "/run/current-system/sw/bin/xwayland-satellite";
	  input = {
	  	keyboard = {
	  		xkb.layout = "us,ru";
	  		xkb.options = "grp:caps_toggle,caps:none";
	  	};
	  	trackpoint = {
	  		enable = true;
	  		accel-speed = -0.4;
	  	};
	  	touchpad = {
	  		scroll-method = "two-finger";
	  		enable = true;
	  		scroll-factor = 1.0;
	  	};
	  };
	  cursor.hide-when-typing = true;

      binds = {
        "Mod+Q" = {
          action.close-window = [];
          repeat = false;
        };
        "Mod+Return".action.spawn = "kitty";
        "Mod+T".action.spawn = "kitty";
        "Mod+Space" = {
          action.spawn-sh = "noctalia msg panel-toggle launcher";
          repeat = false;
        };
        "Mod+W".action.spawn = "firefox";
        "Mod+E".action.spawn = "nautilus";
        "Mod+X".action.spawn = "Telegram";
        "Mod+D".action.spawn = "discord";
        "Mod+Tab" = {
          action.toggle-overview = [];
          repeat = false;
        };
        "Mod+Shift+F".action.fullscreen-window = [ ];
        "Mod+F".action.maximize-column = [ ];
        "Mod+Shift+T".action.toggle-window-floating = [ ];
        "Mod+R".action.switch-preset-column-width = [];
        "Mod+Comma".action.consume-window-into-column = [ ];
        "Mod+Period".action.expel-window-from-column = [ ];
        "Mod+V" = {
        	action.spawn-sh = "noctalia msg panel-toggle clipboard";
        	repeat = false;
        };
        "Mod+N".action.spawn-sh = "noctalia msg settings-open";
        "XF86Display" = {
        	action.power-off-monitors = [ ];
        	repeat = false;	
        };
		"XF86AudioMute".action.spawn-sh = "noctalia msg volume-mute";
		"XF86AudioLowerVolume".action.spawn-sh = "noctalia msg volume-down";
		"XF86AudioRaiseVolume".action.spawn-sh = "noctalia msg volume-up";
		"XF86MonBrightnessDown".action.spawn-sh = "noctalia msg brightness-down all";
		"XF86MonBrightnessUp".action.spawn-sh = "noctalia msg brightness-up all";
		"XF86AudioMicMute".action.spawn-sh = "noctalia msg mic-mute";
		"XF86Search".action.spawn-sh = "noctalia msg media toggle";
		"XF86LaunchA".action.spawn-sh = "noctalia msg media previous";
		"XF86Explorer".action.spawn-sh = "noctalia msg media next";
		"Mod+Alt+L".action.spawn-sh = "noctalia msg session lock";
		"Ctrl+Alt+Delete".action.spawn-sh = "noctalia msg panel-toggle session";
			
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;

        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;
        "Mod+Shift+9".action.move-column-to-workspace = 9;

        "Mod+H".action.focus-column-left = [ ];
        "Mod+J".action.focus-window-down = [ ];
        "Mod+K".action.focus-window-up = [ ];
        "Mod+L".action.focus-column-right = [ ];

        "Mod+Left".action.focus-column-left = [ ];
        "Mod+Down".action.focus-window-down = [ ];
        "Mod+Up".action.focus-window-up = [ ];
        "Mod+Right".action.focus-column-right = [ ];

        "Mod+Shift+H".action.move-column-left = [ ];
        "Mod+Shift+J".action.move-window-down = [ ];
        "Mod+Shift+K".action.move-window-up = [ ];
        "Mod+Shift+L".action.move-column-right = [ ];

	"Mod+Shift+Left".action.move-column-left = [ ];
	"Mod+Shift+Down".action.move-window-down = [ ];
	"Mod+Shift+Up".action.move-window-up = [ ];
	"Mod+Shift+Right".action.move-column-right = [ ];

	"Ctrl+Alt+T".action.spawn-sh = "noctalia msg panel-toggle wallpaper";
	"Ctrl+Alt+Y".action.spawn-sh = "noctalia msg panel-toggle noctalia/wallhaven:browser";
        "Print".action.screenshot = [ ];
        "Ctrl+Print".action.screenshot-screen = [ ];
        "Alt+Print".action.screenshot-window = [ ];
      };

      outputs."eDP-1" = {
        scale = 1.0;
      };

      layout = {
        gaps = 10;
        center-focused-column = "never";
        background-color = "transparent";
        focus-ring = {
          enable = true;
          width = 4;
          active.color = "#7fc8ff";
          inactive.color = "#505050";
        };
        always-center-single-column = true;
      };

      overview.workspace-shadow.enable = false;

      window-rules = [
        {
          geometry-corner-radius = {
            top-left = 10.0;
            top-right = 10.0;
            bottom-left = 10.0;
            bottom-right = 10.0;
          };
          clip-to-geometry = true;
        }
        {
          matches = [
            { app-id = "dev.noctalia.Noctalia"; }
          ];
          open-floating = true;
          default-column-width.fixed = 1117;
          default-window-height.fixed = 787;
        }
        {
        	matches = [
        		{ app-id = "discord"; }
        	];
        	open-maximized = true;
        }
        {
        	matches = [
        		{ app-id = "firefox"; }
        	];
        	open-maximized = true;
        }
        {
        	matches = [
        		{ app-id = "Spotify"; }
        	];
        	open-maximized = true;
        }
        {
        	matches = [
        		{ app-id = "org.prismlauncher.PrismLauncher"; }
        	];
        	open-floating = true;
        	default-column-width.fixed = 954;
        	default-window-height.fixed = 692;
        }
        {
        	matches = [
        		{ title = "Подождите… — Prism Launcher 11.0.3"; }
        	];
        	open-floating = true;
        	default-column-width.fixed = 480;
        	default-window-height.fixed = 226;
        }
        {
        	matches = [
        		{ app-id = "libreoffice-writer"; }
        	];
        	open-maximized = true;
        }
      ];

      layer-rules = [
        {
          matches = [
            { namespace = "^noctalia-wallpaper"; }
          ];
          place-within-backdrop = true;
        }
      ];
      debug.honor-xdg-activation-with-invalid-serial = [ ];
    };
  };

  xdg.configFile."niri-config".enable = lib.mkForce false;
  
  xdg.configFile."niri/config.kdl" = {
    text = ''
      ${config.programs.niri.finalConfig}
        
      include optional=true "${config.home.homeDirectory}/.config/niri/noctalia.kdl"
    '';
  };
}
