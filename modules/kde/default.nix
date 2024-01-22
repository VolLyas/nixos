{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.kde;

in {
    options.modules.kde = { enable = mkEnableOption "kde"; };
    config = mkIf cfg.enable {
        services.xserver = {
            enable = true;
            layout = "us";
            displayManager.sddm = {
                enable = true;
                wayland.enable = true;
            };
            desktopManager = {
                plasma5.enable = true;
            };
        };
        environment.systemPackages =  with pkgs; [
            xwaylandvideobridge
            libreoffice-qt
        ];
        environment.plasma5.excludePackages = with pkgs.libsForQt5; [
          plasma-browser-integration
          konsole
          oxygen
        ];
        services.dbus.enable = true;
        xdg.portal = {
            enable = true;
               wlr.enable = true;
               extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
        };
    };
}
