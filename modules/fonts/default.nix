{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.fonts;

in {
    options.modules.fonts = { enable = mkEnableOption "fonts"; };
    config = mkIf cfg.enable {
		fonts.packages = with pkgs; [
			noto-fonts
			noto-fonts-emoji
			font-awesome
			(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
		];
    };
}
