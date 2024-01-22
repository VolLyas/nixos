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
  
  gtk = {
    enable = true;

    theme = {
        package = pkgs.gruvbox-gtk-theme;
        name = "Gruvbox-Dark-B";
    };

    iconTheme = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir-dark";
    };
    cursorTheme = {
      name = "Qogir";
    };
  };

  qt = {
    enable = true;
  };

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  programs.home-manager.enable = true;
}
