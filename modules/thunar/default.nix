{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.thunar;

in {
    options.modules.thunar = { enable = mkEnableOption "thunar"; };
    config = mkIf cfg.enable {
        programs = {
            thunar = {
                enable = true;
                plugins = with pkgs.xfce; [
                    thunar-archive-plugin
                    thunar-volman
                ];
            };
            xfconf.enable = true;
        };
        services = {
            gvfs.enable = true;
            tumbler.enable = true;
        };
        environment.systemPackages = [
            pkgs.xarchiver
        ];
    };
}
