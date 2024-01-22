{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.gaming;

in {
    options.modules.gaming = { enable = mkEnableOption "gaming"; };
    config = mkIf cfg.enable {
        programs = {
            steam = {
            enable = true;
            remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
            dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
            };
        };
    };
}
