{ config, lib, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName  = "VolLyas";
    userEmail = "vova.lyashik@gmail.com";
  };
}
