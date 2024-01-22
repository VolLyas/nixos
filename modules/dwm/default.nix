{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.dwm;
    slstatus-patched = pkgs.slstatus.override { 
        patches = [
            ./slstatus-patched.diff
        ];
    };
in {
    options.modules.dwm = { enable = mkEnableOption "dwm"; };
    config = mkIf cfg.enable {
        services.xserver = {
            enable = true;
            
            layout = "us,ua";
            xkbOptions = "grp:alt_shift_toggle";
            displayManager.lightdm.enable = true;
            windowManager.dwm = {
                enable = true;
                package = pkgs.dwm.override {
                    patches = [
                        ./dwm-patched.diff
                    ];
                };
            };
        };

        xdg.portal = {
            enable = true;
            extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
            config.common.default = "*";
        };

        environment.systemPackages =  [ 
            slstatus-patched
        ];
    };
}
