{ config, lib, pkgs, ... }:
{
  home.file.".dwm/autostart.sh".source = ./autostart.sh;
  home.file.".dwm/autostart_blocking.sh".source = ./autostart_blocking.sh;
}
