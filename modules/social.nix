{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        google-chrome
        firefox
        discord
        telegram-desktop
    ];
}