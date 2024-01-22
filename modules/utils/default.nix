{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.utils;

in {
    options.modules.utils = { enable = mkEnableOption "utils"; };
    config = mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            unzip
            wget
            playerctl
            pavucontrol
            udiskie
            lf
            killall
            dmenu
            feh
            neofetch
            jq
            dolphin
        ];

        programs = {
            dconf.enable = true;
        };
    };
}
