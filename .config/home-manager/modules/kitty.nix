{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      include ${config.home.homeDirectory}/.config/kitty/themes/noctalia.conf
    '';

    settings = {
      confirm_os_window_close = 0;
      shell = "zsh";
      hide_window_decorations = "yes";
      font_family = "JetBrainsMono Nerd Font";
      "map ctrl+t" = "new_tab";
    };
  };
}
