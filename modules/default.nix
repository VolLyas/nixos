{ inputs, pkgs, config, ... }:

{
    imports = [
        ./communication
        ./development
        ./dwm
        ./fonts
        ./gaming
        ./media
        ./thunar
        ./utils
        ./hyprland
        ./kde
    ];
}
