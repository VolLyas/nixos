{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.hyprland;

in {
    options.modules.hyprland = { enable = mkEnableOption "hyprland"; };
    config = mkIf cfg.enable {
        services.xserver = {
            enable = true;
            layout = "us";
            displayManager.sddm = {
                enable = true;
                wayland.enable = true;
            };
        };
        programs = {
            hyprland = {
                enable = true;
                xwayland.enable = true;
            };
        };
        environment.systemPackages =  with pkgs; [ 
            dunst
            libsForQt5.polkit-kde-agent
            libsForQt5.qt5ct
            libsForQt5.qtstyleplugin-kvantum
            waybar
            swww
            xwaylandvideobridge
            rofi-wayland
            wlogout
            grim
            slurp
            swappy
            wl-clipboard
            wayland-logout
        ];
    };
}
