{ config, lib, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Gruvbox Material Dark Medium";
    settings = {
      font_size = 16;
      background_opacity = "0.9";
      window_padding_width = 10;
      confirm_os_window_close = 0;
    };
  };
}
