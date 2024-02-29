{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        google-chrome
        firefox
        discord
        brave
        telegram-desktop
        thunderbird
    ];
}