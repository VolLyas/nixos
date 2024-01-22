{ config, pkgs, ... }:

{
  imports = [
    # ./i3wm
    # ./dwm
    ./hyprland
    ./waybar
    ./git
    ./kitty
  ];

  home.username = "vl";
  home.homeDirectory = "/home/vl";

  home.stateVersion = "23.11";

  home.sessionVariables = {
    XCURSOR_SIZE = 24;
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
  
#  gtk = {
#    enable = true;
#
#    cursorTheme = {
#      package = pkgs.bibata-cursors;
#      name = "Bibata-Modern-Ice";
#    };
#
#    theme = {
#      package = pkgs.adw-gtk3;
#      name = "adw-gtk3-dark";
#    };
#
#    iconTheme = {
#      package = pkgs.qogir-icon-theme;
#      name = "Qogir-dark";
#    };
#  };
#
#  qt = {
#    enable = true;
#    # platformTheme = "gtk";
#    style.name = "adwaita-dark";
#  };

  programs.home-manager.enable = true;
}
