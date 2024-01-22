{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.development;

in {
    options.modules.development = { enable = mkEnableOption "development"; };
    config = mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            neovim
            kitty
            git
            jetbrains.idea-community
        ];
    };
}
