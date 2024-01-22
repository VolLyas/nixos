{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.communication;

in {
    options.modules.communication = { enable = mkEnableOption "communication"; };
    config = mkIf cfg.enable {
          environment.systemPackages = with pkgs; [
            firefox
            discord
            skypeforlinux
            telegram-desktop
        ];
    };
}
